module OUI
  class MACAddress
    attr_accessor :oui, :organization

    @@part = '([\d|[a-f]|[A-F]][\d|[a-f]|[A-F]])'

    def self.parse(string)
      new(string)
    end

    def self.oui_regex
      /#{@@part}-#{@@part}-#{@@part}/
    end

    def initialize(string)
      string =~ /#{@@part}[:-]?#{@@part}[:-]?#{@@part}[:-]?#{@@part}[:-]?#{@@part}[:-]?#{@@part}/

      @address = "#{$1}:#{$2}:#{$3}:#{$4}:#{$5}:#{$6}"
      @oui = "#{$1}:#{$2}:#{$3}"

      raise 'illegal format' if @address == ':::::'
    end
  end
end
