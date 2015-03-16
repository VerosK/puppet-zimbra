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
class zimbra::install (
) inherits zimbra::params {

  # Create an installation folder
  file {'/opt/zimbra-installer':
    ensure => directory,
  }
  
  file {'/opt/zimbra-installer/install.conf':
    content => template('zimbra/install.conf.erb'),
    require => File['/opt/zimbra-installer'],
  }

  #Prerequisites
  ensure_resource("package", ['sysstat', 'nc'],
      {'ensure' => 'installed'},
  )

  if $::zimbra::params::rpm_package {

    # install installer from pre-packaged RPM
    package {"zimbra-installer":
      name   => $::zimbra::params::rpm_package,
      source => $::zimbra::params::rpm_package_url,
      ensure => installed,
      before => Exec["zimbra::install"],
    }

  } else {
    # download .tar.gz and extract it
    $zimbra_package_tmp = "/tmp/zimbra-installer-package.tar.gz"
    $zimbra_package_url = $::zimbra::params::download_package_url

    exec {"zimbra::download":
      command => "wget -O ${zimbra_package_tmp} ${zimbra_package_url}",
      creates => $zimbra_package_tmp,
      timeout => 1800,
    }

    exec {"zimbra::extract":
      creates  => "/opt/zimbra-installer/install.sh",
      require  => [File['/opt/zimbra-installer'], Exec['zimbra::download']],
      cwd      => "/opt/zimbra-installer",
      command  => "tar xfz ${zimbra_package_tmp} --strip-components=1",
      before   => Exec["zimbra::install"],
    }
  }

  exec { "zimbra::install":
    creates => "/opt/zimbra/bin/zmprov",
    cwd     => "/opt/zimbra-installer",
    command => $::zimbra::params::do_install ? {
        True    => "/opt/zimbra-innstaller/install.sh install.conf",
        default => "echo 'Run manually /opt/zimbra-innstaller/install.sh install.conf'; exit 1",
    },
    require => File['/opt/zimbra-installer/install.conf'],
    }
  # Installing via an unattended file doesn't really work yet. You should run install.sh manually and install the server.
  #exec {"install_zimbra":
  #  command => "/bin/sh -c 'cd /tmp/puppet-zimbra/${filename}; sudo ./install.sh /tmp/puppet-zimbra/install.conf'",
  #  require => Exec['extract_zimbra'],
  #}


}
