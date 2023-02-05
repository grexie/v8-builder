
function build_dir {
  echo -n ~/v8/v8/out.gn/$(arch_label).$(scheme_label)
}

function arch_label {
  echo -n "x64"
}

function arch_patches {
  echo -n
}

function arch_additions {
  echo -n
}


function arch_build {
  if [ "${PLATFORM}" == "android" ]; then
    cp ./third_party/android_ndk/sources/cxx-stl/llvm-libc++/libs/x86_64/libc++_shared.so ./out.gn/x64.$(scheme_label)
  fi
}