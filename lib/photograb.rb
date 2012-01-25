#  A Ruby class to scrape Flickr and feed data to R for processing

#require 'faraday'
require 'flickraw'

module PhotoGrab 
  autoload :Conn, './lib/photograb/conn'
  autoload :Config, './lib/photograb/config'

  class << self
    @config
    @conn

    def config
      @config ||= PhotoGrab::Config.new
    end

    def conn 
      @conn ||= PhotoGrab::Conn.new
    end

    def auth()
      begin
        @conn.auth
      rescue NoMethodError => e
        "Need to initialize connection."
      end
    end
    
    def run
      self.conn
      auth_url = self.conn.preauth.to_s

      puts "Open this url in your browser to complete the authication process : #{auth_url}"
      puts "Copy here the number given when you complete the process."
      verify = gets.strip

      self.conn.auth(verify)
    end
  end
end


if __FILE__ == $0
  PhotoGrab.run
end
