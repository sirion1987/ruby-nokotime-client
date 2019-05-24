require "spec_helper"

RSpec.describe Nokotime::Connection, :vcr do
  subject(:request) { described_class.new }

  let(:response) { request.get(end_point, params: params) }
  let(:end_point) { "/v2/users" }

  describe "with default configuration" do
    let(:params) { {} }
    let(:ua) { response.env.request_headers["User-Agent"] }
    let(:header_token) do
      response.env.request_headers["X-NokoToken"]
    end

    it "responses be in json format" do
      expect(response.env.response_headers["Content-type"]).to(
        eq("application/json; charset=utf-8")
      )
    end

    it "set user agent" do
      expect(ua).to eq("MyNokoBot/1.0")
    end

    it "set X-NokoToken" do
      expect(header_token).not_to be_nil
    end

    context "with page param" do
      let(:params) { {per_page: 1, page: 2} }

      it "responses OK" do
        expect(response.success?).to be(true)
      end
    end

    context "with per_page param" do
      let(:per_page) { 8 }
      let(:params) { {per_page: per_page} }

      it "responses have per_page elements" do
        expect(response.body.count).to eq(per_page)
      end
    end
  end

  describe "with excpections" do
    let(:end_point) { "/invalid_url" }
    let(:params) { {} }

    it "raises a resource not found error for invalid resource" do
      expect { response }.
        to raise_error(Nokotime::Errors::ResourceNotFound)
    end

    it "returns status code" do
      expect { response }.to raise_error do |error|
        expect(error.cause.response[:status]).to eq(404)
      end
    end

    context "with connection failed" do
      before do
        allow(Faraday).to receive(:new).once.and_raise(
          Faraday::ConnectionFailed, "Connection failed"
        )
      end

      it "raises a connection failed exception" do
        expect { response }.
          to raise_error(Nokotime::Errors::ConnectionFailed)
      end
    end

    context "with client error" do
      before do
        allow(Faraday).to receive(:new).once.and_raise(
          Faraday::ClientError, "Client Error"
        )
      end

      it "raises a client error exception" do
        expect { response }.
          to raise_error(Nokotime::Errors::ClientError)
      end
    end

    context "with too many request" do
      # per_page = 1 raise Faraday::ClientError: the server responded
      # with status 429 (Too Many Requests)
      #
      # HTTP/1.1 429 Too Many Requests
      # Content-Type: text/html
      # Retry-After: 3600
      # https://developer.mozilla.org/en-US/docs/Web/HTTP/Status/429

      xit "to implement"
    end
  end
end
