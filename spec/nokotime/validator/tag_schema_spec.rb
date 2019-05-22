require "spec_helper"

module Nokotime
  module Validator
    RSpec.describe TagSchema do
      subject(:validator) { described_class.validate(params) }

      before do
        validator
      end

      describe "with valid params" do
        let(:params) do
          {
            name: "valid_string",
            billable: true,
            per_page: 8
          }
        end

        it "success" do
          expect(validator).to be_a_success
        end
      end

      describe "with unknown params" do
        let(:params) { {unknown_param: "invalid_param"} }

        it "fails" do
          expect(validator).to be_a_failure
        end
      end

      describe "with wrong name" do
        let(:params) { {name: 0} }

        it "fails" do
          expect(validator).to be_a_failure
        end
      end

      describe "with wrong billable" do
        let(:params) { {billable: "invalid_billable"} }

        it "fails" do
          expect(validator).to be_a_failure
        end
      end

      describe "with wrong per_page" do
        let(:params) { {per_page: "invalid_per_page"} }

        it "fails" do
          expect(validator).to be_a_failure
        end
      end
    end
  end
end
