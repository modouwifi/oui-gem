require "spec_helper"

module OUI
  describe Organization do
    it { should respond_to :name }
    it { should respond_to :address }
  end
end
