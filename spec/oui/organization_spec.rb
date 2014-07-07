require "spec_helper"

module OUI
  describe Organization do
    subject { Organization }

    it { should respond_to :parse }

    describe "instance methods" do
      subject { Organization.new }

      it { should respond_to :name }
      it { should respond_to :address }
      it { should respond_to :chinese_name }
    end
  end
end
