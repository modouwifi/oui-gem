module OUI
  class MACAddress
    attr_accessor :oui, :organization

    def self.parse(string)
      new(string)
    end

    def initialize(string)
      part = '([\d|[a-f]|[A-F]][\d|[a-f]|[A-F]])'
      string =~ /#{part}[:-]?#{part}[:-]?#{part}[:-]?#{part}[:-]?#{part}[:-]?#{part}/

      @address = "#{$1}:#{$2}:#{$3}:#{$4}:#{$5}:#{$6}"
      raise 'illegal format' if @address == ':::::'
    end
  end
end
