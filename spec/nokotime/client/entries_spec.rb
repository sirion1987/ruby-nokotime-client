require "spec_helper"

RSpec.describe Nokotime::Client::Entries, :vcr do
  subject(:client) { described_class.new(params) }

  let(:expected_user_keys) do
    a_hash_including(
      "id",
      "date",
      "billable",
      "minutes",
      "description",
      "created_at",
      "updated_at",
      "approved_at",
      "source_url",
      "user",
      "approved_by",
      "tags",
      "project",
      "url",
      "invoiced_outside_of_freckle_url",
      "approved_url",
      "unapproved_url"
    )
  end

  describe "#all" do
    let(:result) { client.all }
    let(:params) do
      {
        updated_from: "2019-01-15T00:00:00Z",
        updated_to: "2019-01-16T00:00:00Z"
      }
    end

    it "returns a Request::MultiplePages" do
      expect(result).to be_a(Nokotime::Request::MultiplePages)
    end

    it "returns a valid user" do
      expect(result.last_responses.first.body.first).to(
        match(expected_user_keys)
      )
    end

    describe "with wrong params" do
      let(:params) { {unknow_param: "invalid_param"} }

      it "raises a invalid params error" do
        expect { result }.to(
          raise_error(Nokotime::Client::Entries::Errors::InvalidParams)
        )
      end
    end
  end

  describe "#show" do
    let(:result) { client.show(fake_id) }
    let(:fake_id) { ENV["REAL_FRECKLE_ENTRY_ID"] }
    let(:params) { {} }

    it "returns a Request::SinglePage" do
      expect(result).to be_a(Nokotime::Request::SinglePage)
    end

    it "returns a valid user" do
      expect(result.last_response.body).to(
        match(expected_user_keys)
      )
    end

    describe "with wrong user id" do
      let(:fake_id) { 0 }

      it "raises a resource not found error" do
        expect { result }.to(
          raise_error(Nokotime::Connection::Errors::ResourceNotFound)
        )
      end
    end
  end
end
