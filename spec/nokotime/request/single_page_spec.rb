require "spec_helper"

RSpec.describe Nokotime::Request::SinglePage, :vcr do
  subject(:request) { described_class.new }

  let(:end_point) { "/v2/users" }
  let(:params) { {per_page: 1} }
  let(:response) { request.get(end_point, params: params) }

  describe "#get" do
    let(:raw_links) { response.raw_links }

    it "returns last rel for the first page" do
      expect(raw_links).to include("rel=\"last\"")
    end

    it "returns next rel for the first page" do
      expect(raw_links).to include("rel=\"next\"")
    end

    it "doesn't returns prev rel for the first page" do
      expect(raw_links).not_to include("rel=\"prev\"")
    end

    it "returns the number of pages" do
      expect(response.total_pages).to be_a(Integer)
    end
  end

  describe "#next" do
    let(:next_page) { response.next }
    let(:raw_links) { next_page.raw_links }

    it "returns first rel for the next page" do
      expect(raw_links).to include("rel=\"first\"")
    end

    it "returns next rel for the next page" do
      expect(raw_links).to include("rel=\"next\"")
    end

    it "returns prev rel for the next page" do
      expect(raw_links).to include("rel=\"prev\"")
    end
  end

  describe "#prev" do
    let(:next_page) { response.next }

    it "previous page is not empty" do
      expect(next_page.prev).to_not be_nil
    end

    it "previous page is an instance of SinglePage" do
      expect(next_page.prev).to be_a(described_class)
    end
  end

  describe "#last" do
    let(:last_page) { response.last }
    let(:raw_links) { last_page.raw_links }

    it "returns first rel for the last page" do
      expect(raw_links).to include("rel=\"first\"")
    end

    it "returns prev rel for the last page" do
      expect(raw_links).to include("rel=\"prev\"")
    end

    it "doesn't returns next rel for the last page" do
      expect(raw_links).not_to include("rel=\"next\"")
    end
  end

  describe "#first" do
    let(:first_page) { response.last.first }
    let(:raw_links) { first_page.raw_links }

    it "returns last rel for the first page" do
      expect(raw_links).to include("rel=\"last\"")
    end

    it "returns next rel for the first page" do
      expect(raw_links).to include("rel=\"next\"")
    end

    it "doesn't returns prev rel for the first page" do
      expect(raw_links).not_to include("rel=\"prev\"")
    end
  end
end
