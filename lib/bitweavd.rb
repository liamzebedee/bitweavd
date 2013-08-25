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
  def self.find_external_ip
    external_ip = ''
    
    uri = URI.parse 'http://91.198.22.70:80' # checkip.dyndns.org
    Net::HTTP.new(uri.host, uri.port).start do |http|
      http.request_get('/') do |resp|
        # The response looks like:
        # Current IP Address: 81.155.100.200
        # I peeked at https://github.com/haibt/dyndns_client/blob/master/dynclient.rb for this
        external_ip = resp.read_body.gsub(/[^:]*: ([^<]*)<.*$/, "\\1")
      end
    end
    # XXX check if this doesn't work
    
    puts "External IP is #{external_ip}"
  end
end
