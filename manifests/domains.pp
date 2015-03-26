#
# Configure domains for zimbra
#
class zimbra::domains($names=[], $aliases={}) {

  Zimbra::Domain<| |> -> Zimbra::Alias_domain <| |>

  zimbra::domain{$names:
    ensure => present,
  }

  $alias_domains = keys($aliases)
  zimbra::alias_domain{$alias_domains:
    aliases_config => $aliases,
  }
}
