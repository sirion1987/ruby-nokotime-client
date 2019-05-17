require "spec_helper"

module Nokotime
  module Validator
    RSpec.describe UserSchema do
      subject(:validator) { described_class.validate(params) }

      before do
        validator
      end

      describe "with valid params" do
        let(:params) do
          {
            name: "valid name",
            email: "email@example.com",
            role: "coworker",
            state: "active",
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

      describe "with wrong email" do
        let(:params) { {email: "invalid_email"} }

        it "fails" do
          expect(validator).to be_a_failure
        end
      end

      describe "with wrong role" do
        let(:params) { {role: "invalid_role"} }

        it "fails" do
          expect(validator).to be_a_failure
        end
      end

      describe "with wrong state" do
        let(:params) { {state: "invalid_state"} }

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
