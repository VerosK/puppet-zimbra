#
# Configure domains for zimbra
#
class zimbra::domains($names=[], $aliases={}) {

  zimbra::domain{$names:
    ensure => present,
  }
}
