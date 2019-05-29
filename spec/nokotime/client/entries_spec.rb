require "spec_helper"

RSpec.describe Nokotime::Client::Entries, :vcr do
  subject(:client) { described_class.new(params) }

  let(:expected_keys) do
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
    let(:responses) { client.all }
    let(:params) do
      {
        updated_from: "2019-01-15T00:00:00Z",
        updated_to: "2019-01-16T00:00:00Z"
      }
    end

    it_behaves_like "a multiple pages"
    it_behaves_like "an endpoint with valid parameters"
  end

  describe "#show" do
    let(:response) { client.show(fake_id) }
    let(:fake_id) { ENV["REAL_NOKOTIME_ENTRY_ID"] }
    let(:params) { {} }

    it_behaves_like "a single page"
    it_behaves_like "an endpoint with valid resource"
  end
end
