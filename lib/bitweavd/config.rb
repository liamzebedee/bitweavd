module BitWeavD
  class Configuration
    CONFIG_DEFAULT = {
      :clientAPI => {
        :port => 8880,
        :addr => 'localhost'
      },
    }
    attr_accessor :config, :data_dir, :config_path
    
    def initialize(data_dir)
      @data_dir = data_dir
      @config_path = File.join(data_dir, 'bitweav.toml')
      @config = load_config
      @config.deep_merge(CONFIG_DEFAULT)
      save_config
    end
    
    def load_config
      begin
        TOML.load_file(config_path, symbolize_keys: true)
      rescue Errno::ENOENT
        # file doesn't exist, create it.
        FileUtils.mkdir_p(File.dirname(config_path))
        File.new(config_path, "w").close
        CONFIG_DEFAULT
      end
    end
    
    def save_config
      File.open(config_path, 'w') { |file| 
        file.write(TOML.dump(config))
      }
    end
    
    private :load_config
  end
end
