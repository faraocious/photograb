require 'yaml'

module PhotoGrab

  class Config
    @config

    def initialize
      file_location = File.expand_path('./config.yml')
      @config = YAML::load(File.read(file_location))
    end

    def consumer_key
      @config["consumer_key"]
    end

    def secret
      @config["secret"]
    end
  end
end

