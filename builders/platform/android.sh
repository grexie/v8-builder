
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
      zip
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