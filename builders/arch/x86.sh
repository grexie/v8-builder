
function arch_label {
  echo -n "ia32"
}

function arch_patches {

}

function arch_additions {

}


function arch_build {
  if [ "${PLATFORM}" == "android" ]; then
    cp ./third_party/android_ndk/sources/cxx-stl/llvm-libc++/libs/x86/libc++_shared.so ./out.gn/ia32.$(scheme_label)
  fi
}