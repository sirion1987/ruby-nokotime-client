RSpec.shared_examples_for "a multiple pages" do
  it "returns a Request::MultiplePages" do
    expect(responses).to be_a(Nokotime::Request::MultiplePages)
  end

  it "returns a valid resources" do
    expect(responses.last_responses.first.body.first).to(
      match(expected_keys)
    )
  end
end
