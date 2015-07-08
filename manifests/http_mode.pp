#
# Create one zimbra domain alias
#
class  zimbra::http_mode(
    $http_mode='redirect') {

  $allowed_modes = ['http','redirect', 'https']
  validate_re($http_mode, $allowed_modes)

  if (($::zimbra_server) and ($::zimbra_mailmode != $http_mode)) {
    exec { "zimhra::http_mode: Switch Zimbra http mode from ${::zimbra_mailmode} to ${http_mode}":
      user    => 'zimbra',
      command => "/opt/zimbra/bin/zmtlsctl ${http_mode}",
    }
  }
}
