#  A Ruby class to scrape Flickr and feed data to R for processing

require 'faraday'
require 'flickraw'

module PhotoGrab 
  class OAuth < Faraday::Middleware

    def initialize(app, options = {})
      @app = app
      @options = options

    end

    def call(env)
      if not @flickr.test.login

        token = @flickr.get_request_token
        auth_url = @flickr.get_authorize_url(token['oauth_token'], {:perms => 'read'})

        puts "Open this url in your browser to complete the authication process : #{auth_url}"
        puts "Copy here the number given when you complete the process."
        verify = gets.strip

        @flickr.get_access_token(token['oauth_token'], token['oauth_token_secret'], verify)
        begin
          flickr.test.login
          puts "Login Successful"
        rescue FlickRaw::FailedResponse => e
          puts "Login Failed: #{e.message}"
        end
      end

      @app.call(env)
    end
  end
end


