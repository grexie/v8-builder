set -e

VERSION=$1

git config --global user.name "V8 macOS Builder"
git config --global user.email "v8.macos.builder@localhost"
git config --global core.autocrlf false
git config --global core.filemode false
git config --global color.ui true


cd ~
echo "=====[ Getting Depot Tools ]====="	
git clone -q https://chromium.googlesource.com/chromium/tools/depot_tools.git || true
export PATH=$(pwd)/depot_tools:$PATH
gclient config --spec 'solutions = [
  {
    "name": "webrtc",
    "url":"https://webrtc.googlesource.com/src.git"
  }
]
'
gclient sync

mkdir -p webrtc
cd webrtc

echo "=====[ Fetching V8 ]====="
echo "target_os = ['mac']" >>.gclient
cd ~/webrtc/webrtc
git checkout $VERSION
gclient sync


echo "=====[ Building V8 ]====="
python ./tools/dev/v8gen.py arm64.release -vv -- '
target_os = "mac"
is_component_build = true
use_custom_libcxx = false
v8_enable_i18n_support = true
v8_static_library = true
v8_use_external_startup_data = false
symbol_level = 0
'
ninja -C out.gn/arm64.release -t clean
ninja -C out.gn/arm64.release webrtc
