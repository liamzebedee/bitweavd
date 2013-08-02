module BitWeavD
  class Daemon
    def self.run(options)
      config = BitWeavD::Configuration.new(options.dataDir)
    end
  end
end
