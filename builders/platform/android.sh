function build_dir() {
  echo -n ~/v8/v8/out.gn/$(arch).$(scheme)
}

function platform_label() {
  echo -n "android"
}

function copy_assets() {
  find $(build_dir) -type f -name "*.so"
  find $(build_dir) -type f -name "*.a"
  find $(build_dir) -type f -name "*.dat"
  echo -n $(build_dir)/clang_*/bytecode_builtins_list_generator
  echo -n $(build_dir)/clang_*/gen-regexp-special-case
  echo -n $(build_dir)/clang_*/mksnapshot
  echo -n $(build_dir)/clang_*/torque
}

function platform_setup() {
  sudo apt-get install -y \
      pkg-config \
      git \
      subversion \
      curl \
      wget \
      build-essential \
      python \
      xz-utils \
      zip
}

function platform_requirements() {
  ./build/install-build-deps-android.sh
}

function platform_additions() {

}

function platform_patches() {

}

function platform_build() {
  
}