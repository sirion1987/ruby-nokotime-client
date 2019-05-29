require "spec_helper"

RSpec.describe Nokotime::Client::Users, :vcr do
  subject(:client) { described_class.new(params) }

  let(:expected_keys) do
    a_hash_including(
      "id",
      "email",
      "first_name",
      "last_name",
      "profile_image_url",
      "state",
      "role",
      "entries",
      "expenses",
      "created_at",
      "updated_at",
      "url",
      "entries_url",
      "expenses_url",
      "activate_url",
      "deactivate_url",
      "give_access_to_projects_url",
      "revoke_access_to_projects_url",
      "revoke_access_to_all_projects_url"
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
    let(:fake_id) { ENV["REAL_NOKOTIME_USER_ID"] }
    let(:params) { {} }

    it_behaves_like "a single page"
    it_behaves_like "an endpoint with valid resource"
  end
end
