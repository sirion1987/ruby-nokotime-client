require "spec_helper"

RSpec.describe Nokotime::Client::Users, :vcr do
  subject(:client) { described_class.new(params) }

  let(:expected_user_keys) do
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
    let(:result) { client.all }
    let(:params) { {} }

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
          raise_error(Nokotime::Client::Users::Errors::InvalidParams)
        )
      end
    end
  end

  describe "#show" do
    let(:result) { client.show(fake_id) }
    let(:fake_id) { ENV["REAL_FRECKLE_USER_ID"] }
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
