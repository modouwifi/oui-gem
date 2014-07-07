module OUI
  class Organization
    attr_accessor :name, :address, :chinese_name

    def initialize
      yield self if block_given?
    end

    def self.parse(string)
      raise 'not implemented yet'
    end
  end
end
