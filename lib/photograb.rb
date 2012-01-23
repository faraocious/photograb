#  A Ruby class to scrape Flickr and feed data to R for processing

require 'faraday'

module PhotoGrab 
  autoload :OAuth, './lib/photograb/oauth'
  autoload :Config, './lib/photograb/config'

  class << self
    @config

    def initialize

    end

    def config
      @config ||= PhotoGrab::Config.new
    end

    def scrape
      url = PhotoGrab.config.endpoint_secure
      conn = Faraday.new(:url => url) do |builder|
        builder.use PhotoGrab::OAuth
      end
      conn.get('/')
    end
  end
end


if __FILE__ == $0
  PhotoGrab.scrape
end
