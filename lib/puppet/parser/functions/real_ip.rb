module Puppet::Parser::Functions
  newfunction(:real_ip, :type => :rvalue, :doc => <<-EOS
    Takes a foreman host and returns the right ip to use in services
    like loadbalancing/monitoring/etc.
    This functions is required to map the real ip to use since depending on
    our cloud provider and environment (staging/hosted) our servers has
    different ethernet interfaces and different public and private ips.
    EOS
  ) do |args|

    if args.size == 0
      raise(Puppet::ParseError, "real_ip(): Wrong number of arguments need at least one")
    end

    server, scope  = args
    if scope == 'private'
      server['facts']['ec2_local_ipv4'] || server['facts']['ipaddress_eth1'] || server['facts']['public_dns']
    else
      server['facts']['ec2_public_hostname'] || server['facts']['ipaddress_eth1'] || server['facts']['public_dns']
    end

  end
end
