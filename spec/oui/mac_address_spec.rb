require "spec_helper"

module OUI
  describe MACAddress do
    subject { MACAddress }
    it { should respond_to :parse }
  end
end
