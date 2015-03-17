#
# Configure basic firewall for zimbra
#
class zimbra::firewall {
  Firewall{
    action => 'accept',
  }

  firewall{ '010 smtp':
    dport => '25',
  }
  firewall{ '015 http':
    dport => '80',
  }
  firewall{ '011 imaps':
    dport => '993',
  }
  firewall{ '012 pop3s':
    dport => '995',
  }
  firewall{ '013 legacy_secure_smtp':
    dport => '465',
  }
  firewall{ '014 alternate_smtp':
    dport => '587',
  }
  firewall{ '016 zimbra_admin':
    dport => '7071',
  }
  firewall{ '017 ldap':
    dport  => '389',
  }
}