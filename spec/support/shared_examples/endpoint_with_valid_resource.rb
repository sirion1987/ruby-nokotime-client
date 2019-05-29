RSpec.shared_examples_for "an endpoint with valid resource" do
  context "with wrong id" do
    let(:fake_id) { 0 }

    it "raises a resource not found error" do
      expect { response }.to(
        raise_error(Nokotime::Errors::ResourceNotFound)
      )
    end
  end
end
