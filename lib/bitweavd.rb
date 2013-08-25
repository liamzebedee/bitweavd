# 3rd party
require 'toml'
require 'webrick'
require 'json'
require 'net/http'
require 'uri'
require 'agent'

# internal requires
require 'bitweavd-info'
require 'bitweavd/cmd_daemon'
require 'bitweavd/cmd_rpc'
require 'bitweavd/config'
require 'bitweavd/core_ext'
require 'bitweavd/client_api'

module BitWeavD
  attr_accessor :external_ip
  def get_external_ip
    uri = URI.parse 'http://91.198.22.70:80' # checkip.dyndns.org
    Net::HTTP.new(uri.host, uri.port).start do |http|
      http.request_get('/') do |resp|
        # The response looks like:
        # Current IP Address: 81.155.100.200
        @external_ip = resp.body.chomp('Current IP Address: ')
      end
    end
    p "Current IP Address: #{external_ip}"
  end
end
