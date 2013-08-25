require 'helper'

class TestGetIP < Test::Unit::TestCase  
  def test_get_ip
    puts BitWeavD::find_external_ip
  end
end
