module BitWeavD
  class Daemon
    def self.run(options)
      config = BitWeavD::Configuration.new(options.dataDir)
      # XXX move these into unit tests
      puts config.config[:clientAPI][:port]
      config.config[:clientAPI][:port] = 1231
      config.save_config
    end
  end
end
