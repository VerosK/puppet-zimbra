# = Class: zimbra
#
# This is the main zimbra class
#
#
# == Parameters
#
# Standard class parameters
# Define the general class behaviour and customizations
#
# See README for usage patterns.
#
class zimbra (
    $disable  = false,
    $absent   = false,
    $version  = '8.0.5',
    $firewall = true,
    $domain                 = params_lookup('domain'),
    $admin_pass             = params_lookup('admin_pass'),
    $sql_root_pass          = params_lookup('sql_root_pass'),
    $ldap_pre_pass          = params_lookup('ldap_pre_pass'),
    $ldap_post_pass         = params_lookup('ldap_post_pass'),
    $ldap_amavis_pass       = params_lookup('ldap_amavis_pass'),
    $ldap_root_pass         = params_lookup('ldap_root_pass'),
    $ldap_admin_pass        = params_lookup('ldap_admin_pass'),
    $download_package_url   = params_lookup('download_package_url'),
    $download_package_file  = params_lookup('download_package_file'),
  ) inherits zimbra::params {

  if (any2bool($firewall)) {
    include iptables
#    Service              Port    
#    Remote Queue Manager 22
#    Postfix              25
#    HTTP                 80
#    POP3                 110
#    IMAP                 143
#    LDAP                 389
#    HTTPS                443
#    Mailboxd IMAP SSL    993
#    Mailboxd POP SSL     995
#    Mailboxd LMTP        7025
  }

  # Create an installation folder
  file {'/tmp/puppet-zimbra':
    ensure => directory,
  }
  
  file {'/tmp/puppet-zimbra/install.conf':
    content => template('zimbra/install.conf.erb'),
    require => File['/tmp/puppet-zimbra'],
  }

  #Prerequisites
  package { ['libgmp3c2', 'pax', 'sysstat']:
    ensure => installed,
    require => File['/tmp/puppet-zimbra/install.conf']
  }
  ->
  exec {"wget -O /tmp/puppet-zimbra/zimbrapackage.tgz ${download_package_url}${download_package_file}; \
        tar -xzvf zimbrapackage.tgz -C /tmp/puppet-zimbra/zimbrapackage": # /tmp/puppet-zimbra/zimbrapackage/install.sh":
    require => File['/tmp/puppet-zimbra'],
  }
  

}