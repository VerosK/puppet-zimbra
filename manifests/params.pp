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
class zimbra::params () {
  $download_package_url = 'http://files2.zimbra.com/downloads/8.0.5_GA/'

  $download_package_file =  $operatingsystem ? {
       /(?i-mx:ubuntu|debian)/        => 'zcs-8.0.5_GA_5839.UBUNTU12_64.20130910124038',
       /(?i-mx:suse)/                 => 'zcs-8.0.5_GA_5839.SLES11_64.20130910123623',
       /(?i-mx:centos|fedora|redhat)/ => 'zcs-8.0.5_GA_5839.RHEL6_64.20130910123908',
       default                        => 'zcs-8.0.5_GA_5839.UBUNTU12_64.20130910124038',
    }

  $download_package_ext = '.tgz'

  $domain = $::fqdn

  $admin_pass       = '100%Coffee'
  $sql_root_pass    = '100%Coffee'
  $ldap_pre_pass    = '100%Coffee'
  $ldap_post_pass   = '100%Coffee'
  $ldap_amavis_pass = '100%Coffee'
  $ldap_root_pass   = '100%Coffee'
  $ldap_admin_pass  = '100%Coffee'
  $http_port        = '17080' #Different ports because these are usually in use
  $https_port       = '17443' #Different ports because these are usually in use
  
}
