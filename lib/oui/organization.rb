module OUI
  class Organization
    attr_accessor :name, :address, :chinese_name

    def initialize
      yield self if block_given?
    end
  end
end
