require "spec_helper"

RSpec.describe Nokotime::Client::Projects, :vcr do
  subject(:client) { described_class.new(params) }

  let(:expected_project_keys) do
    a_hash_including(
      "id",
      "name",
      "description",
      "billing_increment",
      "enabled",
      "billable",
      "color",
      "created_at",
      "updated_at",
      "group",
      "minutes",
      "billable_minutes",
      "unbillable_minutes",
      "invoiced_minutes",
      "uninvoiced_minutes",
      "remaining_minutes",
      "budgeted_minutes",
      "participants",
      "entries",
      "entries_url",
      "url",
      "merge_url",
      "archive_url",
      "unarchive_url"
    )
  end

  describe "#all" do
    let(:result) { client.all }
    let(:params) { {} }

    it "returns a Request::MultiplePages" do
      expect(result).to be_a(Nokotime::Request::MultiplePages)
    end

    it "returns a valid project" do
      expect(result.last_responses.first.body.first).to(
        match(expected_project_keys)
      )
    end

    describe "with wrong params" do
      let(:params) { {unknow_param: "invalid_param"} }

      it "raises a invalid params error" do
        expect { result }.to(
          raise_error(Nokotime::Client::Projects::Errors::InvalidParams)
        )
      end
    end
  end

  describe "#show" do
    let(:result) { client.show(fake_id) }
    let(:fake_id) { ENV["REAL_FRECKLE_PROJECT_ID"] }
    let(:params) { {} }

    it "returns a Request::SinglePage" do
      expect(result).to be_a(Nokotime::Request::SinglePage)
    end

    it "returns a valid project" do
      expect(result.last_response.body).to(
        match(expected_project_keys)
      )
    end

    describe "with wrong project id" do
      let(:fake_id) { 0 }

      it "raises a resource not found error" do
        expect { result }.to(
          raise_error(Nokotime::Connection::Errors::ResourceNotFound)
        )
      end
    end
  end
end
