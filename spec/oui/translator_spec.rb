# coding: utf-8
require "spec_helper"

module OUI
  describe Translator do
    subject { Translator }
    it { should respond_to :translate }

    describe "translate" do
      it "translate OUI info into Chinese" do
        expect(Translator.translate("Apple")).to eq("苹果")
      end
    end
  end
end
