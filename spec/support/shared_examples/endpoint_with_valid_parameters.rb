RSpec.shared_examples_for "an endpoint with valid parameters" do
  context "with wrong params" do
    let(:params) { {unknow_param: "invalid_param"} }

    it "raises a invalid params error" do
      expect { responses }.to(
        raise_error(Nokotime::Errors::InvalidParams)
      )
    end
  end
end
