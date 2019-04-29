require "spec_helper"

RSpec.describe Nokotime::Client::Users do
  subject(:client) { described_class.new(params) }

  describe "#all" do
    let(:result) { client.all }

    describe "with valid params" do
      let(:params) do
        {
          name: "valid name",
          email: "email@example.com",
          role: "coworker",
          state: "active",
          per_page: 8
        }
      end

      it "success" do
        expect{ result }.not_to raise_error
      end
    end

    describe "with unknow params" do
      let(:params) do
        {
          unknow_param: "invalid_param"
        }
      end

      it "raises a invalid params error" do
        expect do
          result
        end.to raise_error(
          Nokotime::Client::Users::Errors::InvalidParams
        )
      end
    end

    describe "with wrong email" do
      let(:params) do
        {
          email: "invalid_email"
        }
      end

      it "raises a invalid params error" do
        expect do
          result
        end.to raise_error(
          Nokotime::Client::Users::Errors::InvalidParams
        )
      end
    end

    describe "with wrong role" do
      let(:params) do
        {
          role: "invalid_role"
        }
      end

      let(:result) { client.all }

      it "raises a invalid params error" do
        expect do
          result
        end.to raise_error(
          Nokotime::Client::Users::Errors::InvalidParams
        )
      end
    end

    describe "with wrong state" do
      let(:params) do
        {
          role: "invalid_state"
        }
      end

      it "raises a invalid params error" do
        expect do
          result
        end.to raise_error(
          Nokotime::Client::Users::Errors::InvalidParams
        )
      end
    end
  end
end
