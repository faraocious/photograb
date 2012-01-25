#  A Ruby class to scrape @flickr and feed data to R for processing

require 'flickraw'

module PhotoGrab 

  class Conn
    @flicker

    def initialize
      FlickRaw.shared_secret = PhotoGrab.config.secret
      FlickRaw.api_key = PhotoGrab.config.consumer_key
      @flickr = FlickRaw::Flickr.new
    end

#    def secure (secure = nil)
#      @flickr.secure = secure unless secure == nil
#      @flickr.secure
#    end

    def preauth
      begin
        @flickr.test.login
      rescue FlickRaw::OAuthClient::FailedResponse
        token = @flickr.get_request_token
        auth_url = @flickr.get_authorize_url(token['oauth_token'], {:perms => 'read'})
        return auth_url.to_s
      end

      def postauth (auth_verify)

        @flickr.get_access_token(token['oauth_token'], token['oauth_token_secret'], verify)
        begin
          @flickr.test.login
          puts "Login Successful"
        rescue FlickRaw::FailedResponse => e
          puts "Login Failed: #{e.message}"
        end
      end
      self
    end
  end
end


