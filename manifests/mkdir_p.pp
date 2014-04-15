##
# This will create the directory with its parents
# chown the result to $user and set it to $mode permissions
#
# The permissions are only applied to the leaf directory
define redbooth-stdlib::mkdir_p( $directory = $name, $owner = 'root', $group = 'root', $mode = '0700' ) {

  exec { "make-dir-${$directory}":
    provider => 'shell',
    command  => "mkdir -p ${directory};
                 chown ${owner}:${group} ${directory};
                 chmod ${mode} ${directory};",
    user     => 'root',
    unless   => "[ -d ${directory} ] && [ `stat -c %U ${directory}` = ${owner} ]",
  }

}
