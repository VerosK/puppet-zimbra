#
# Create one zimbra domain alias
#
define zimbra::alias_domain(
    $domain_name = $title,
    $aliases_config = {},
    $ensure='present') {

  $zmprov = '/opt/zimbra/bin/zmprov'
  $master_domain = $aliases_config[$domain_name]

  if ($ensure == 'absent') {
    fail("Use zimbra::domain to drop domain aliases")
  } else {
    exec { "Create domain alias ${domain_name}":
      user    => 'zimbra',
      unless  => "${zmprov} getDomain ${domain_name} zimbraId",
      command => "${zmprov} createAliasDomain ${domain_name} ${master_domain}",
    }
  }
}
