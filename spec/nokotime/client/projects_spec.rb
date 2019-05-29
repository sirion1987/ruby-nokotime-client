require "spec_helper"

RSpec.describe Nokotime::Client::Projects, :vcr do
  subject(:client) { described_class.new(params) }

  let(:expected_keys) do
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
    let(:responses) { client.all }
    let(:params) { {} }

    it_behaves_like "a multiple pages"
    it_behaves_like "an endpoint with valid parameters"
  end

  describe "#show" do
    let(:response) { client.show(fake_id) }
    let(:fake_id) { ENV["REAL_NOKOTIME_PROJECT_ID"] }
    let(:params) { {} }

    it_behaves_like "a single page"
    it_behaves_like "an endpoint with valid resource"
  end
end
