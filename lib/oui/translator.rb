module OUI
  class Translator
    def initialize
      require "yaml"

      @@translations = YAML.load_file(File.expand_path('../../../data/translations.yml', __FILE__))
    end

    def translate(english)
      @@translations[english]
    end

    def self.translate(english)
      @@instance ||= new
      @@instance.translate(english)
    end
  end
end
