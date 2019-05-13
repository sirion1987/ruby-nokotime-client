RSpec.configure do |config|
  config.before do
    Nokotime.configure do |c|
      c.token = ENV["NOKOTIME_TOKEN"]
      c.auth_type = :noko_token
      c.max_concurrency = 5
    end
  end

  config.after do
    Nokotime.reset
  end
end
