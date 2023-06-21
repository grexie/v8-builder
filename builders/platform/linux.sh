

function platform_label {
  echo -n "linux"
}

function copy_assets {
  find $(build_dir) -type f -name "*.so"
  find $(build_dir) -type f -name "*.a"
  find $(build_dir) -type f -name "*.dat" | head -n1
  echo $(build_dir)/bytecode_builtins_list_generator
  echo $(build_dir)/gen-regexp-special-case
  echo $(build_dir)/mksnapshot
  echo $(build_dir)/torque
}

function platform_setup {
  sudo apt-get update
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
      ninja-build \
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
  ./build/install-build-deps.sh --no-syms --no-nacl --no-prompt
}

function platform_additions {
  echo "is_clang = true"
}

function platform_patches {
  echo -n
}

function platform_build {
  echo -n
}

function platform_ninja {
  if [ "${ARCH}" == "arm64" ]; then
    ./build/linux/sysroot_scripts/install-sysroot.py --arch=arm64
  fi
  if [ "${ARCH}" == "arm" ]; then
    ./build/linux/sysroot_scripts/install-sysroot.py --arch=arm
    export LD_LIBRARY_PATH=/usr/arm-linux-gnueabihf/lib/
  fi
  if [ "${ARCH}" == "x86" ]; then
    ./build/linux/sysroot_scripts/install-sysroot.py --arch=x86
  fi
}
