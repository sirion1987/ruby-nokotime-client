require "spec_helper"

RSpec.describe Nokotime::Client::ProjectGroups, :vcr do
  subject(:client) { described_class.new(params) }

  let(:expected_project_group_keys) do
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
    let(:result) { client.all }
    let(:params) { {} }

    it "returns a Request::MultiplePages" do
      expect(result).to be_a(Nokotime::Request::MultiplePages)
    end

    it "returns a valid project groups" do
      expect(result.last_responses.first.body.first).to(
        match(expected_project_group_keys)
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
