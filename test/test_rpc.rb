require 'helper'
require 'commander'

class TestRPC < Test::Unit::TestCase
  def test_server_start
  	### Run server in separate thread
  	daemon_options = Commander::Command::Options.new
  	daemon_options.dataDir = File.join(Dir.home, '.bitweav')
  	go! { BitWeavD::CmdDaemon.run(daemon_options) }
  	# wait for some things to run. XXX easy hack.
  	sleep 0.5
  	
  	### Run rpc in main thread
  	rpc_options = Commander::Command::Options.new
  	rpc_options.dataDir = File.join(Dir.home, '.bitweav')
  	rpc_args = ['test_add', "[1,2]"]
  	BitWeavD::CmdRpc.run(rpc_options, rpc_args)
  end
end
