#
# Set one zimbra server_setting by calling zmprov modifyServer
#
# if server is null, default server name is used
#
define zimbra::server_setting($setting=$title,
    $value = undef,
    $server = undef) {

  validate_re($setting, '^[a-zA-Z0-9]+$')

  $zimbra_server = $server ? {
      undef   => $::zimbra_server,
      default => $server,
  }

  $command = "/opt/zimbra/bin/zmprov ms ${zimbra_server} ${setting} \'${value}\'"
  $check_command = "/opt/zimbra/bin/zmprov gs ${zimbra_server} ${setting} | /bin/grep -E \'${setting}: ${value}\'"

  exec { "zimbra::params: Change ${setting}: to ${value}":
      user    => 'zimbra',
      command => $command,
      unless => $check_command,
  }
}
