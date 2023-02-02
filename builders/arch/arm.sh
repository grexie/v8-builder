
function arch_label() {
  echo -n "arm"
}

function arch_patches() {

}

function arch_additions() {

}


function arch_build() {
  if [ "${PLATFORM}" == "android" ]; then
    cp ./third_party/android_ndk/sources/cxx-stl/llvm-libc++/libs/armeabi-v7a/libc++_shared.so ./out.gn/arm.$(scheme_label)
  fi
}