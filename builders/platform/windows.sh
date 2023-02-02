
function build_dir {
  echo -n ~/v8/v8/out.gn/${ARCH}.${SCHEME}
}

function platform_setup {
  echo -n
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
  echo -n
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