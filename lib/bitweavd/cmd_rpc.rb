module BitWeavD
  class CmdRpc
    def self.run(options, args)
      config = BitWeavD::Configuration.new(options.dataDir)
      configx = config.config
      username = configx[:clientAPI][:username]
      password = configx[:clientAPI][:password]
      host = configx[:clientAPI][:host]
      port = configx[:clientAPI][:port]
      # XXX check for wrong auth
      client = ClientApiClient.new("http://#{username}:#{password}@#{host}:#{port}/jsonrpc")
      command = args[0].to_sym
      # XXX check for json parse error
      command_args = JSON.parse args[1]
      puts client.send command, command_args
    end
  end
end
