#
# Create/delete one zimbra domain
#
define zimbra::domain(
  $domain_name = $title,
  $ensure = 'present')
{

  $zmprov = '/opt/zimbra/bin/zmprov'
  if ($ensure == 'absent') {
      exec { "Drop domain domain ${domain_name}}":
      user    => 'zimbra',
      unless  => "${zmprov} getDomain ${domain_name} zimbraId",
      command => "${zmprov} deleteDomain ${domain_name}",
    }
  } else {
    exec { "Create domain ${domain_name}}":
      user    => 'zimbra',
      unless  => "${zmprov} getDomain ${domain_name} zimbraId",
      command => "${zmprov} createDomain ${domain_name}",
    }
  }
}
