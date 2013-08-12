module BitWeavD
  class CmdDaemon
    def self.test_add(a,b)
      "The sum of #{a} and #{b} is #{a + b}"
    end
    
    def self.run(options)
      config = BitWeavD::Configuration.new(options.dataDir).config
      rpc = ClientApiServer.new(config[:clientAPI][:port], config[:clientAPI][:username], config[:clientAPI][:password])
      trap 'INT' do rpc.shutdown end
      rpc['test_add'] = method(:test_add)
      rpc.serve
    end
  end
end
