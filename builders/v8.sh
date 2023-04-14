#!/bin/bash -x

ROOTDIR=$(pwd)

. builders/platform/${PLATFORM}.sh
. builders/arch/${ARCH}.sh
. builders/scheme/${SCHEME}.sh

platform_setup

git config --global user.name "V8 Builder"
git config --global user.email "v8@localhost"
git config --global core.autocrlf false
git config --global core.filemode false
git config --global color.ui true


cd ~
echo "=====[ Getting Depot Tools ]====="	
git clone -q https://chromium.googlesource.com/chromium/tools/depot_tools.git
export PATH=$(pwd)/depot_tools:$PATH
gclient


mkdir v8
cd v8

echo "=====[ Fetching V8 ]====="
fetch v8
echo "target_os = ['$(platform_label)']" >> .gclient
cd ~/v8/v8
platform_requirements
git checkout $VERSION
gclient sync

set -e

platform_patches
arch_patches

echo "=====[ Building V8 ]====="
python ./tools/dev/v8gen.py $(arch_label).$(scheme_label) -vv -- "
target_os = \"$(platform_label)\"
is_clang = true
is_component_build = false
use_custom_libcxx = false
v8_enable_i18n_support = true
v8_monolithic = true
v8_use_external_startup_data = false
target_cpu = \"$(arch_label)\"
v8_target_cpu = \"$(arch_label)\"
$(platform_additions)
$(arch_additions)
$(scheme_additions)
"
arch_corrections
platform_ninja
ninja -C out.gn/$(arch_label).$(scheme_label) -t clean
ninja -C out.gn/$(arch_label).$(scheme_label) v8_monolith

platform_build
arch_build

zip -j -r ~/v8/v8.zip $(copy_assets)
