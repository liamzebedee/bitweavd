require 'helper'

class TestConfiguration < Test::Unit::TestCase  
  def test_modify
  	# Modify, save, reload and check if the value has persisted
  	config = BitWeavD::Configuration.new(File.join(Dir.home, '.bitweav'))
  	previous = config.config[:clientAPI][:port]
  	expected = config.config[:clientAPI][:port] = 0
    config.save_config
    
    @config = BitWeavD::Configuration.new(File.join(Dir.home, '.bitweav'))
    val = config.config[:clientAPI][:port]
    # Reset to default
    config.config[:clientAPI][:port] = previous
    config.save_config
    
    assert_equal(expected, val)
  end
end
