require 'simple_oauth'
require 'faraday'

#  A Ruby class to scrape Flickr and feed data to R for processing
module PhotoGrab 
  class OAuth < Faraday::Middleware

    def initialize(app, options = {})
      @app = app
      @options = options
    end

    def call(env)
      params = env[:body] || {}
      signature_params = params
      params.each do |key, value|
        signature_params = {} if value.respond_to?(:content_type)
      end

      oauth = Simple_OAuth::Consumer(PhotoGrab.config.consumer_key, PhotoGrab.config.secret, { :site => Photgrab.config.endpoint_secure })

      @request_token = oauth.get_request_token
      @access_token = @request_token.get_access_token

      oauth = Simple_OAuth::Header.new(
        env[:method],
        env[:url],
        signature_params,
        @options
      )
    end
  end
end


