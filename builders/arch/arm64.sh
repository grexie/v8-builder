
function arch_label {
  echo -n "arm64"
}

function arch_patches {
  echo -n
}

function arch_additions {
  echo -n
}


function arch_build {
  if [ "${PLATFORM}" == "android" ]; then
    cp ./third_party/android_ndk/sources/cxx-stl/llvm-libc++/libs/arm64-v8a/libc++_shared.so ./out.gn/arm64.$(scheme_label)
  fi
}