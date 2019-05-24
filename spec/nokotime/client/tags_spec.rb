require "spec_helper"

RSpec.describe Nokotime::Client::Tags, :vcr do
  subject(:client) { described_class.new(params) }

  let(:expected_tag_keys) do
    a_hash_including(
      "id",
      "name",
      "billable",
      "formatted_name",
      "entries",
      "entries_url",
      "url",
      "created_at",
      "updated_at"
    )
  end

  describe "#all" do
    let(:result) { client.all }
    let(:params) { {} }

    it "returns a Request::MultiplePages" do
      expect(result).to be_a(Nokotime::Request::MultiplePages)
    end

    it "returns a valid tag" do
      expect(result.last_responses.first.body.first).to(
        match(expected_tag_keys)
      )
    end

    describe "with wrong params" do
      let(:params) { {unknow_param: "invalid_param"} }

      it "raises a invalid params error" do
        expect { result }.to(
          raise_error(Nokotime::Errors::InvalidParams)
        )
      end
    end
  end
end
