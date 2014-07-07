require "spec_helper"

module OUI
  describe MACAddress do
    subject { MACAddress }

    it { should respond_to :parse }
    it { should respond_to :oui_regex }

    describe "parse" do
      subject { MACAddress }

      it "parses MAC address like 001122334455" do
        expect(subject.parse('001122334455')).not_to be_nil
      end

      it "parses MAC address like 00-11-22-33-44-55" do
        expect(subject.parse('00-11-22-33-44-55')).not_to be_nil
      end

      it "parses MAC address like 00:11:22:33:44:55" do
        expect(subject.parse('00:11:22:33:44:55')).not_to be_nil
      end

      it "does not parse MAC address like 00:11:22:3344" do
        expect { subject.parse('00:11:22:3344') }.to raise_error
      end

      it "parses MAC address like 00:11:22:33:aa:bb" do
        expect(subject.parse('00:11:22:33:aa:bb')).not_to be_nil
      end

      it "parses MAC address like 00:11:22:33:AA:BB" do
        expect(subject.parse('00:11:22:33:AA:BB')).not_to be_nil
      end
    end

    describe "instance methods" do
      subject { MACAddress.parse('001122334455') }

      it { should respond_to :oui }
      it { should respond_to :organization }

      describe "oui" do
        it "extracts oui from mac address" do
          expect(subject.oui).to eq('00-11-22')
        end

        it "parses organization from database" do
          real_mac_address = '14:10:9f:ea:49:3e'

          Database.stub(:look_up_organization_by_oui).and_return(Organization.new { |o| o.name = 'Apple' })

          organization = MACAddress.parse(real_mac_address).organization

          expect(organization.name).to eq('Apple')
        end
      end
    end
  end
end
