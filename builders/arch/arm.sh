function build_dir {
  echo -n ~/v8/v8/out.gn/$(arch_label).$(scheme_label)/clang_x86_v8_arm
}

function arch_label {
  echo -n "arm"
}

function arch_patches {
  echo -n
}

function arch_additions {
  echo -n
}

function arch_corrections {
  echo -n
}

function arch_build {
  if [ "${PLATFORM}" == "android" ]; then
    cp ./third_party/android_ndk/sources/cxx-stl/llvm-libc++/libs/armeabi-v7a/libc++_shared.so ./out.gn/arm.$(scheme_label)
  fi
}