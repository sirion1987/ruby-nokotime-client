RSpec.shared_examples_for "a single page" do
  it "returns a Request::SinglePage" do
    expect(response).to be_a(Nokotime::Request::SinglePage)
  end

  it "returns a valid resource" do
    expect(response.last_response.body).to(
      match(expected_keys)
    )
  end
end
