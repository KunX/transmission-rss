require 'singleton'
require 'yaml'

module TransmissionRSS
  # Class handles configuration parameters.
  class Config < Hash
    # This is a singleton class.
    include Singleton

    # Merges a Hash or YAML file (containing a Hash) with itself.
    def load(config)
      case config.class.to_s
      when 'Hash'
        self.merge! config
      when 'String'
        self.merge_yaml! config
      else
        raise ArgumentError.new 'Could not load config.'
      end
    end

    # Merge Config Hash with Hash from YAML file.
    def merge_yaml!(path)
      self.merge! YAML.load_file(path)
    end
  end
end
