require 'helper'

class TestGetIP < Test::Unit::TestCase  
  def get_ip
    BitWeavD.get_external_ip
  end
end
