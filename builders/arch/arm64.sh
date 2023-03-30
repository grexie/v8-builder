function build_dir {
  rm -Rf ~/v8/v8/out.gn/$(arch_label).$(scheme_label)/clang_x64_v8_arm64
  echo -n ~/v8/v8/out.gn/$(arch_label).$(scheme_label)
}

function arch_label {
  echo -n "arm64"
}

function arch_patches {
  echo -n
}

function arch_additions {
  echo -n
}

function arch_corrections {
  sed -i '' -e '/^.*target_cpu *= *"x64".*$/d' ~/v8/v8/out.gn/$(arch.label).$(scheme_label)/args.gn
}

function arch_build {
  if [ "${PLATFORM}" == "android" ]; then
    cp ./third_party/android_ndk/sources/cxx-stl/llvm-libc++/libs/arm64-v8a/libc++_shared.so ./out.gn/arm64.$(scheme_label)
  fi
}