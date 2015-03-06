# Class: zimbra::params
#
# This class defines default parameters used by the main module class zimbra
# Operating Systems differences in names and paths are addressed here
#
# == Variables
#
# Refer to zimbra class for the variables defined here.
#
# == Usage
#
# This class is not intended to be used directly.
# It may be imported or inherited by other classes
#

#https://files.zimbra.com/downloads/8.6.0_GA/zcs-8.6.0_GA_1153.RHEL6_64.20141215151155.tgz
class zimbra::params (
  /* use either url */
  $download_package_url = 'https://files.zimbra.com/downloads/8.6.0_GA/zcs-8.6.0_GA_1153.RHEL6_64.20141215151155.tgz',
  /* download installer from RPM repo */
  $rpm_package      = undef,
  $rpm_package_url  = undef,

  $admin_pass       = '100%Coffee',
  $sql_root_pass    = '100%Coffee',
  $ldap_rep_pass    = '100%Coffee',
  $ldap_post_pass   = '100%Coffee',
  $ldap_amavis_pass = '100%Coffee',
  $ldap_root_pass   = '100%Coffee',
  $ldap_admin_pass  = '100%Coffee',
  $http_port        = '80',
  $https_port       = '443',
  $domain           = 'example.org',
  $hostname         = $::fqdn,
  /* used for creating ham & spam mailboxes */
  $secretcode       = 'r4nd0m.Ha5h',

  /* if do_install is set to true, then install is fired up */
  $do_install       = false,
){
}
