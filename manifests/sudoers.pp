#
# Configure sudoers for zimbra
#
sudo::conf{ 'zimbra':
  source => 'puppet:///modules/zimbra/zimbra.sudoers',
}
