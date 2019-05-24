require "spec_helper"

module Nokotime
  module Validator
    RSpec.describe ProjectGroupSchema do
      subject(:validator) { described_class.validate(params) }

      before do
        validator
      end

      describe "with valid params" do
        let(:params) do
          {
            name: "valid_string",
            project_ids: "1,2,3",
            per_page: 30
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

      describe "with project ids" do
        let(:params) { {project_group_ids: 123} }

        it "fails" do
          expect(validator).to be_a_failure
        end
      end
    end
  end
end
