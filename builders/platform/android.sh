
function platform_label {
  echo -n "android"
}

function copy_assets {
  find $(build_dir) -type f -name "*.so"
  find $(build_dir) -type f -name "*.a"
  find $(build_dir) -type f -name "*.dat"
  echo $(build_dir)/clang_*/bytecode_builtins_list_generator
  echo $(build_dir)/clang_*/gen-regexp-special-case
  echo $(build_dir)/clang_*/mksnapshot
  echo $(build_dir)/clang_*/torque
}

function platform_setup {
  sudo apt-get install -y \
      pkg-config \
      git \
      subversion \
      curl \
      wget \
      build-essential \
      python2 \
      xz-utils \
      zip \
      libatomic1

  if [ "${ARCH}" == "arm64" ]; then
    sudo apt-get install -y crossbuild-essential-arm64 libatomic1-arm64-cross
  fi

  if [ "${ARCH}" == "arm" ]; then
    sudo apt-get install -y crossbuild-essential-armhf libatomic1-armhf-cross
  fi

  if [ "${ARCH}" == "x86" ]; then
    sudo apt-get install -y crossbuild-essential-i386 libatomic1-i386-cross
  fi
}

function platform_requirements {
  ./build/install-build-deps-android.sh
}

function platform_additions {
  echo -n
}

function platform_patches {
  echo -n
}

function platform_build {
  echo -n
}

function platform_ninja {
  echo -n
}
