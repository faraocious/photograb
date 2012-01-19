require 'yaml'

module PhotoGrab

  class Config
      @config
    def initialize
      file_location = File.expand_path('config.yml')
      @config = YAML::load(File.read_file(file_location))
    end
    def consumer_key
      return @config[:consumer_key]
    end

    def secret
      return @config[:secret]
    end

    def endpoint
      return @config[:endpoint]
    end

    def endpoint_secure
      return @config[:endpoint_secure]

    end
  end
end

