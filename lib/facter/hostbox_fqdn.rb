Facter.add('hostbox_fqdn') do
  setcode do
    hostbox = File.exists?('/etc/hostbox_fqdn') ?  File.read('/etc/hostbox_fqdn') : File.read('/etc/hostname')
    hostbox.strip
  end
end

