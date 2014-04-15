define redbooth-stdlib::unzip($zipfile = $name, $dest_dir, $creates) {

  exec { "unzip-${zipfile}-to-${dest_dir}":
    command  => "unzip ${zipfile} -d ${dest_dir}",
    provider => shell,
    cwd      => '/tmp',
    creates  => "${dest_dir}/${creates}",
  }

}
