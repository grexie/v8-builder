
function platform_label {
  echo -n "android"
}

function copy_assets {
  rm -Rf $(build_dir)/clang_*
  find $(build_dir) -type f -name "*.so"
  find $(build_dir) -type f -name "*.a"
  find $(build_dir) -type f -name "*.dat"
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
  echo "is_clang = true"

  if [ "${ARCH}" == "arm" ]; then
    echo "use_custom_libcxx = true"
  else
    echo "use_custom_libcxx = false"
  fi
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
