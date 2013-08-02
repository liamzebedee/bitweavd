module BitWeavD
  class CmdDaemon
    def self.run(options)
      config = BitWeavD::Configuration.new(options.dataDir)
    end
  end
end
