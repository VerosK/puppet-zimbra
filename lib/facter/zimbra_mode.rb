require 'puppet'

if Facter.value(:puppetversion).to_i >= 3 && File.exist?("/opt/zimbra/bin/zmprov")

  Facter.add(:zimbra_servers) do
    setcode do
        all_servers = Facter::Util::Resolution.exec('/opt/zimbra/bin/zmprov getAllServers')
        all_servers.split()
    end
  end


  Facter.add(:zimbra_server) do
    setcode do
        all_servers = Facter.value(:zimbra_servers)
        all_servers[0]
    end
  end

  Facter.add(:zimbra_mailmode) do
    setcode do
        zimbra_server = Facter.value(:zimbra_server)
        mode = Facter::Util::Resolution.exec("/opt/zimbra/bin/zmprov getServer #{zimbra_server} zimbraMailMode")
        mode.split("\n").grep(/:/)[0].split(':')[-1].strip()
    end
  end
end
