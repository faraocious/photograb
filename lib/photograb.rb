require 'faraday'

#  A Ruby class to scrape Flickr and feed data to R for processing
module PhotoGrab 
  autoload :OAuth, './photograb/oauth'
  autoload :Config, './photograb/config'

  class << self
    def initialize

    end

    def config
      @config ||= PhotoGrab::Config.new
    end
  end

  def scrape
    url = PhotoGrab.config.secure_endpoint
    conn = Faraday.new(:url => url) do |builder|
      builder.use PhotoGrab::OAuth
    end
    conn.get('/')
  end
end


if __FILE__ == $0
  pg = PhotoGrab.new
  pg.scrape
end
