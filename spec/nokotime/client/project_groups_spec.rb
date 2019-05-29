require "spec_helper"

RSpec.describe Nokotime::Client::ProjectGroups, :vcr do
  subject(:client) { described_class.new(params) }

  let(:expected_keys) do
    a_hash_including(
      "id",
      "name",
      "created_at",
      "updated_at",
      "projects",
      "url",
      "entries_url",
      "projects_url",
      "add_projects_url",
      "remove_projects_url",
      "remove_all_projects_url"
    )
  end

  describe "#all" do
    let(:responses) { client.all }
    let(:params) { {} }

    it_behaves_like "a multiple pages"
    it_behaves_like "an endpoint with valid parameters"
  end
end
