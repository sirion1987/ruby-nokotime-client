require "spec_helper"

RSpec.describe Nokotime::Request::MultiplePages, :vcr do
  subject(:request) { described_class.new }

  let(:end_point) { "/v2/users" }
  let(:response) { request.get(end_point) }

  describe "#get" do
    it "returns an array of faraday object" do
      expect(response.last_responses).to all(be_a(Faraday::Response))
    end
  end
end
