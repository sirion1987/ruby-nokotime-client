require "spec_helper"

module Nokotime
  # rubocop:disable Metrics/ModuleLength
  module Validator
    RSpec.describe EntrySchema do
      subject(:validator) { described_class.validate(params) }

      before do
        validator
      end

      describe "with valid params" do
        let(:params) do
          {
            user_ids: "1,2",
            description: "aaa",
            project_ids: "1,2",
            tag_ids: "1,2",
            tag_filter_type: "and",
            from: "2018-01-01",
            to: "2018-01-01",
            updated_from: "2018-01-15T00:00:00Z",
            updated_to: "2018-01-15T00:00:00Z",
            billable: true,
            approved_at_from: "2018-01-15T00:00:00Z",
            approved_at_to: "2018-01-15T00:00:00Z",
            approved_by_ids: "1,2",
            per_page: 30
          }
        end

        it "success" do
          expect(validator).to be_a_success
        end
      end

      describe "with unknow params" do
        let(:params) { {unknow_param: "invalid_param"} }

        it "fails" do
          expect(validator).to be_a_failure
        end
      end

      describe "with wrong user ids" do
        let(:params) { {user_id: 1234} }

        it "fails" do
          expect(validator).to be_a_failure
        end
      end

      describe "with wrong description" do
        let(:params) { {description: 1234} }

        it "fails" do
          expect(validator).to be_a_failure
        end
      end

      describe "with wrong project ids" do
        let(:params) { {project_ids: 1234} }

        it "fails" do
          expect(validator).to be_a_failure
        end
      end

      describe "with wrong tag ids" do
        let(:params) { {tag_ids: 1234} }

        it "fails" do
          expect(validator).to be_a_failure
        end
      end

      describe "with wrong tag filter type" do
        let(:params) { {tag_filter_type: "or"} }

        it "fails" do
          expect(validator).to be_a_failure
        end
      end

      describe "with wrong invoice ids" do
        let(:params) { {invoice_ids: 1234} }

        it "fails" do
          expect(validator).to be_a_failure
        end
      end

      describe "with wrong import ids" do
        let(:params) { {import_ids: 1234} }

        it "fails" do
          expect(validator).to be_a_failure
        end
      end

      describe "with wrong from" do
        let(:params) { {from: 1234} }

        it "fails" do
          expect(validator).to be_a_failure
        end
      end

      describe "with wrong to" do
        let(:params) { {to: 1234} }

        it "fails" do
          expect(validator).to be_a_failure
        end
      end

      describe "with wrong invoiced" do
        let(:params) { {invoiced: 1234} }

        it "fails" do
          expect(validator).to be_a_failure
        end
      end

      describe "with wrong invoiced at from" do
        let(:params) { {invoiced_at_from: 1234} }

        it "fails" do
          expect(validator).to be_a_failure
        end
      end

      describe "with wrong invoiced at to" do
        let(:params) { {invoiced_at_to: 1234} }

        it "fails" do
          expect(validator).to be_a_failure
        end
      end

      describe "with wrong updated from" do
        let(:params) { {updated_from: 1234} }

        it "fails" do
          expect(validator).to be_a_failure
        end
      end

      describe "with wrong updated to" do
        let(:params) { {updated_to: 1234} }

        it "fails" do
          expect(validator).to be_a_failure
        end
      end

      describe "with wrong billable" do
        let(:params) { {user_id: 1234} }

        it "fails" do
          expect(validator).to be_a_failure
        end
      end

      describe "with wrong approved at from" do
        let(:params) { {approved_at_from: 1234} }

        it "fails" do
          expect(validator).to be_a_failure
        end
      end

      describe "with wrong approved at to" do
        let(:params) { {approved_at_to: 1234} }

        it "fails" do
          expect(validator).to be_a_failure
        end
      end

      describe "with wrong approved by ids" do
        let(:params) { {approved_by_ids: 1234} }

        it "fails" do
          expect(validator).to be_a_failure
        end
      end
    end
  end
  # rubocop:enable Metrics/ModuleLength
end
