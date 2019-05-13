require "spec_helper"

RSpec.describe Nokotime::Paginator do
  subject(:paginator) { described_class.new(raw_links) }

  describe "#next" do
    let(:raw_links) do
      "<https://api.nokotime.com/v2/users?page=1>; rel=\"first\",\
         <https://api.nokotime.com/v2/users?page=2>; rel=\"next\""
    end

    it "returns link of next page" do
      expect(paginator.next).to eq("/v2/users?page=2")
    end
  end

  describe "#prev" do
    let(:raw_links) do
      "<https://api.nokotime.com/v2/users?page=1>; rel=\"prev\",\
         <https://api.nokotime.com/v2/users?page=3>; rel=\"next\""
    end

    it "returns link of previous page" do
      expect(paginator.prev).to eq("/v2/users?page=1")
    end
  end

  describe "#last" do
    let(:raw_links) do
      "<https://api.nokotime.com/v2/users?page=1>; rel=\"prev\",\
         <https://api.nokotime.com/v2/users?page=2>; rel=\"last\""
    end

    it "returns link of previous page" do
      expect(paginator.last).to eq("/v2/users?page=2")
    end
  end

  describe "#first" do
    let(:raw_links) do
      "<https://api.nokotime.com/v2/users?page=1>; rel=\"first\",\
         <https://api.nokotime.com/v2/users?page=2>; rel=\"next\""
    end

    it "returns link of previous page" do
      expect(paginator.first).to eq("/v2/users?page=1")
    end
  end

  context "with empty raw links" do
    let(:raw_links) { "" }

    describe "#next" do
      it "return nil" do
        expect(paginator.next).to eq(nil)
      end
    end

    describe "#prev" do
      it "return nil" do
        expect(paginator.prev).to eq(nil)
      end
    end

    describe "#last" do
      it "return nil" do
        expect(paginator.last).to eq(nil)
      end
    end

    describe "#first" do
      it "return nil" do
        expect(paginator.first).to eq(nil)
      end
    end
  end

  context "with empty array raw links" do
    let(:raw_links) { [] }

    describe "#next" do
      it "return nil" do
        expect(paginator.next).to eq(nil)
      end
    end

    describe "#prev" do
      it "return nil" do
        expect(paginator.prev).to eq(nil)
      end
    end

    describe "#last" do
      it "return nil" do
        expect(paginator.last).to eq(nil)
      end
    end

    describe "#first" do
      it "return nil" do
        expect(paginator.first).to eq(nil)
      end
    end
  end
end
