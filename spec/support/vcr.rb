require "vcr"

VCR.configure do |c|
  c.hook_into :webmock
  c.allow_http_connections_when_no_cassette = true
  c.cassette_library_dir = "spec/fixtures/vcr_cassettes"

  c.configure_rspec_metadata!
  c.default_cassette_options = {
    match_requests_on: [:method, :query, :body]
  }

  c.filter_sensitive_data("<TOKEN>") { filter_api_token }

  c.before_record do |interaction|
    AnonymizeInteraction.new(interaction: interaction).call
  end
end

def filter_api_token
  ENV.fetch "NOKOTIME_TOKEN", "noko_token"
end
