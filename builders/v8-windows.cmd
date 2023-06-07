set VERSION=%1

git config --global user.name "V8 Windows Builder"
git config --global user.email "v8.windows.builder@localhost"
git config --global core.autocrlf false
git config --global core.filemode false
git config --global color.ui true

cd %HOMEPATH%
echo =====[ Getting Depot Tools ]=====
powershell -command "Invoke-WebRequest https://storage.googleapis.com/chrome-infra/depot_tools.zip -O depot_tools.zip"
7z x depot_tools.zip -o*
set PATH=%CD%\depot_tools;%PATH%
set DEPOT_TOOLS_WIN_TOOLCHAIN=0
call gclient


mkdir v8
cd v8

echo =====[ Fetching V8 ]=====
call fetch v8
echo target_os = ['win'] >> .gclient
cd v8
call git checkout %VERSION%
call gclient sync
echo call patch --ignore-whitespace --verbose -p0 < %GITHUB_WORKSPACE%\builders\BUILD.gn.patch


echo =====[ Building V8 ]=====
call python3 .\tools\dev\v8gen.py x64.release -vv -- target_os="""win""" is_component_build=true use_custom_libcxx=false v8_static_library=true is_clang=true use_lld=false v8_enable_verify_heap=false v8_enable_i18n_support=true v8_use_external_startup_data=false symbol_level=0

call ninja -C out.gn\x64.release -t clean
call ninja -C out.gn\x64.release v8
call ninja -C out.gn\x64.release v8_libplatform

cd out.gn\x64.release
call 7z a depot_tools.zip -r *.dll *.lib *.exp *.ilk *.exe *.dat
