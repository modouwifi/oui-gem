module OUI
  class MACAddress
    attr_accessor :oui, :organization

    @@part = '[\d|[a-f]|[A-F]][\d|[a-f]|[A-F]]'

    def self.parse(string)
      new(string)
    end

    def self.oui_regex
      /#{self.oui_regex_string}/
    end

    def self.oui_regex_string
      "#{@@part}-#{@@part}-#{@@part}"
    end

    def initialize(string)
      string =~ /(#{@@part})[:-]?(#{@@part})[:-]?(#{@@part})[:-]?(#{@@part})[:-]?(#{@@part})[:-]?(#{@@part})/

      @address = "#{$1}:#{$2}:#{$3}:#{$4}:#{$5}:#{$6}"
      @oui = "#{$1}-#{$2}-#{$3}"

      raise 'illegal format' if @address == ':::::'
    end

    def organization
      unless @organization
        @organization = Database.look_up_organization_by_oui(@oui)
      end

      @organization
    end
  end
end
