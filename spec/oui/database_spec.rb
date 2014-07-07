require "spec_helper"

module OUI
  describe Database do
    subject { Database }

    it { should respond_to :look_up_organization_by_oui }
  end
end
