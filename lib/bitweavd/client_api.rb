module BitWeavD
  # We use JSON-RPC over HTTP with basic authentication
  # Non-threaded sequential access.
  class ClientApiServer    
    RESPONSE = {
      'result' => [],
      'id' => nil,
      'error' => nil,
    }
    
    def initialize(port, username, password)
      @server = WEBrick::HTTPServer.new :Port => port
      @username = username
      @password = password
      @realm = 'jsonrpc'
      @procedures = {}
    end
    
    def serve
      ### Host a HTTP 1.1 server
      @server.mount_proc '/jsonrpc' do |req, res|        
        ### Break conditions
        break if req.request_method != 'POST'
        break if req.content_type != 'application/json'
        # XXX break if not localhost
        
        # Authenticate
        WEBrick::HTTPAuth.basic_auth(req, res, @realm) do |user, pass|
          user == @username && pass == @password
        end
        
        # Decode the request from JSON to object.
        request = JSON.parse req.body
        response = RESPONSE
        procedure = @procedures[request['method']]
        params = request['params']
        
        if procedure == nil then
          response['error'] = "Procedure not found."
        else
          ### Run procedure and put result into response
          begin
            response['result'] = procedure.(*params)
          rescue Exception => error
            response['error'] = "Error while executing #{request['method']}:\n" + error.to_s
          end
        end
        
        ### Send response
        # this is a notification, and thus has no response
        break if request['id'] == nil
        response['id'] = request['id']
        
        res.body = JSON.dump response
      end
      @server.start
    end
    
    # Probably not very good for things
    def shutdown
      @server.shutdown
    end
    
    def []=(name, method)
      @procedures[name] = method
    end
  end
  
  class ClientApiClient
    def initialize(service_url)
      @uri = URI.parse(service_url)
    end
    
    def method_missing(name, *args)
      post_body = { 'method' => name, 'params' => args[0], 'id' => 'jsonrpc' }.to_json
      resp = JSON.parse( http_post_request(post_body) )
      # XXX pass the error back 
      raise JsonRpcError, resp['error'] if resp['error']
      resp['result']
    end
 
    def http_post_request(post_body)
      http    = Net::HTTP.new(@uri.host, @uri.port)
      request = Net::HTTP::Post.new(@uri.request_uri)
      request.basic_auth @uri.user, @uri.password
      request.content_type = 'application/json'
      request.body = post_body
      http.request(request).body
    end
 
    class JsonRpcError < RuntimeError; end
  end
end
