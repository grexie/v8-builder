
function build_dir {
  echo -n ~/v8/v8/out.gn/${ARCH}.${SCHEME}
}

function platform_setup {

}

function platform_label {
  echo -n windows
}

function copy_assets {
  find $(build_dir) -type f -name "*.dll"
  find $(build_dir) -type f -name "*.lib"
  find $(build_dir) -type f -name "*.exp"
  find $(build_dir) -type f -name "*.ilk"
  find $(build_dir) -type f -name "*.exe"
  find $(build_dir) -type f -name "*.dat"
}

function platform_requirements {
 
}

function platform_additions {

}

function platform_patches {

}

function platform_build {

}