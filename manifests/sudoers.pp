#
# Configure sudoers for zimbra
#
class zimbra::sudoers{

  sudo::conf{ 'zimbra':
    source => 'puppet:///modules/zimbra/zimbra.sudoers',
  }
}
