#!/bin/bash -x
set -x
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
python3 ./tools/dev/v8gen.py $(arch_label).$(scheme_label) -vv -- "
target_os = \"$(platform_label)\"
is_component_build = false
use_custom_libcxx = true
v8_enable_i18n_support = false
clang_use_chrome_plugins = false
v8_enable_test_features = false
v8_enable_sandbox = false
treat_warnings_as_errors = false
v8_static_library = true
v8_monolithic = true
v8_use_external_startup_data = false
target_cpu = \"$(arch_label)\"
v8_target_cpu = \"$(arch_label)\"
$(platform_additions)
$(arch_additions)
$(scheme_additions)
"
# v8_enable_pointer_compression = false
arch_corrections
platform_ninja
ninja -C out.gn/$(arch_label).$(scheme_label) -t clean
ninja -j 8 -C out.gn/$(arch_label).$(scheme_label) v8_monolith

platform_build
arch_build

zip -j -r ~/v8/v8.zip $(copy_assets)
