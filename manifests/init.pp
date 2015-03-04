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
) inherits zimbra::params {

  # Create an installation folder
  file {'/opt/zimbra':
    ensure => directory,
  }

  class{ "zimbra::install":
  }

  file {'/opt/zimbra/bin':
    ensure  => directory,
    require => Class["Zimbra::Install"],
  }


}
