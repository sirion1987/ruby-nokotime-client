require "spec_helper"

RSpec.describe Nokotime::Configuration do
  describe "with configuration" do
    let(:auth_type) { :noko_token }
    let(:max_concurrency) { 2 }
    let(:token) { "fake_token" }
    let(:url) { "http://foobar.com" }

    before do
      Nokotime.configure do |config|
        config.auth_type = auth_type
        config.max_concurrency = max_concurrency
        config.token = token
        config.url = url
      end
    end

    it "returns authentication type" do
      expect(Nokotime.configuration.auth_type).to eq(auth_type)
    end

    it "returns max concurrency" do
      expect(Nokotime.configuration.max_concurrency).to(
        eq(max_concurrency)
      )
    end

    it "returns token" do
      expect(Nokotime.configuration.token).to eq(token)
    end

    it "returns url" do
      expect(Nokotime.configuration.url).to eq(url)
    end
  end

  describe "without configuration" do
    before do
      Nokotime.reset
    end

    it "raises a configuration error for authentication type" do
      expect do
        Nokotime.configuration.auth_type
      end.to raise_error(Nokotime::Errors::Configuration)
    end

    it "raises a configuration error for max concurrency" do
      expect do
        Nokotime.configuration.max_concurrency
      end.to raise_error(Nokotime::Errors::Configuration)
    end

    it "raises a configuration error for token" do
      expect do
        Nokotime.configuration.token
      end.to raise_error(Nokotime::Errors::Configuration)
    end

    it "returns default url" do
      expect(Nokotime.configuration.url).to(
        eq(Nokotime::Configuration::DEFAULT_URL)
      )
    end
  end

  describe "with wrong configuration" do
    before do
      Nokotime.reset
      Nokotime.configure do |config|
        config.auth_type = :wrong_auth_type
      end
    end

    it "raises a configuration error for authentication type" do
      expect do
        Nokotime.configuration.auth_type
      end.to raise_error(Nokotime::Errors::Configuration)
    end
  end
end
