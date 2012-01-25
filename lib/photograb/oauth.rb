require 'simple_oauth'
require 'oauth'
require 'faraday'

#  A Ruby class to scrape Flickr and feed data to R for processing
module PhotoGrab 
  class OAuth < Faraday::Middleware

    def initialize(app, options = {})
      @app = app
      @options = options
    end

    def call(env)
      if not @auth_token
        FlickRaw.api_key = PhotoGrab.config.consumer_key
        FlickRaw.shared_secret = PhotoGrab.config.secret

        token = flickr.get_request_token
        auth_url = flickr.get_authorize_url(token['oauth_token'], {:perms => 'read'})

        puts "Open this url in your process to complete the authication process : #{auth_url}"
        puts "Copy here the number given when you complete the process."
        verify = gets.strip
      end

      @app.call(env)
    end
  end
end


