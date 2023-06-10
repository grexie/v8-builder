
function platform_label {
  echo -n ios
}

function copy_assets {
  find $(build_dir) -type f -name "*.dylib"
  find $(build_dir) -type f -name "*.a"
  find $(build_dir) -type f -name "*.dat" | head -n1
  echo $(build_dir)/bytecode_builtins_list_generator
  echo $(build_dir)/gen-regexp-special-case
  echo $(build_dir)/mksnapshot
}

function platform_setup {
  brew install ninja
}

function platform_requirements {
  echo -n
}

function platform_additions {
  echo "v8_enable_pointer_compression = false"
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
