require 'simple_oauth'
require 'faraday'

#  A Ruby class to scrape Flickr and feed data to R for processing
module PhotoGrab 
  class OAuth < Faraday::Middleware

    def initialize(app, options)
      @app = app
      @options = options
    end

    def call(env)
      puts env
      exit
      params = env[:body] || {}
      signature_params = params
      params.each do |key, value|
        signature_params = {} if value.respond_to?(:content_type)
      end

      PhotoGrab::Config.initialize     
      oauth = Simple_OAuth::Header.new(
        env[:method],
        env[:url],
        signature_params
        @options
      )
    end

end


