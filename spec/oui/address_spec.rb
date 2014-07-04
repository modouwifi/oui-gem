require "spec_helper"

module OUI
  describe Address do
    subject { Address.new }

    it { should respond_to :country }
    it { should respond_to :lines }
  end
end
