require "spec_helper"

RSpec.describe Nokotime::Client::Tags, :vcr do
  subject(:client) { described_class.new(params) }

  let(:expected_keys) do
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
    let(:responses) { client.all }
    let(:params) { {} }

    it_behaves_like "a multiple pages"
    it_behaves_like "an endpoint with valid parameters"
  end
end
