module Puppet::Parser::Functions
  newfunction(:puppet_file_exists, :type => :rvalue, :doc => <<-EOS
    Returns true if a file exists in the puppet repo
    EOS
  ) do |args|

    raise(Puppet::ParseError, "puppet_file_exists(): Wrong number of arguments " +
          "need at least one") if args.size == 0

    return !Puppet::FileServing::Metadata.indirection.find(args.first).nil?

  end
end
