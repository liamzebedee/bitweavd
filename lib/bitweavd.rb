# 3rd party
require 'toml'
require 'webrick'
require 'json'
require 'net/http'
require 'agent'

# internal requires
require 'bitweavd-info'
require 'bitweavd/cmd_daemon'
require 'bitweavd/cmd_rpc'
require 'bitweavd/config'
require 'bitweavd/core_ext'
require 'bitweavd/client_api'

module BitWeavD
  def self.find_external_ip
    external_ip = ''
    
    # The json response looks like:
    # {"ip": "122.148.96.160"}
    Net::HTTP.get_response(URI('http://ip.jsontest.com/')) { |res| external_ip = JSON.parse(res.body)["ip"] }
    # XXX check if this doesn't work
    
    puts "External IP is #{external_ip}"
  end
end
