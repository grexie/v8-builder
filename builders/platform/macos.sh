function build_dir() {
  echo -n ~/v8/v8/out.gn/${ARCH}.${SCHEME}
}

function platform_label() {
  echo -n mac
}

function copy_assets() {
  find $(build_dir) -type f -name "*.dylib"
  find $(build_dir) -type f -name "*.a"
  find $(build_dir) -type f -name "*.dat"
  echo -n $(build_dir)/bytecode_builtins_list_generator
  echo -n $(build_dir)/gen-regexp-special-case
  echo -n $(build_dir)/mksnapshot
  echo -n $(build_dir)/torque
}

function platform_setup() {

}

function platform_requirements() {
 
}

function platform_additions() {

}

function platform_patches() {

}

function platform_build() {
  
}