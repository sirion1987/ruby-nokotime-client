RSpec.configure do |config|
  config.before(:each) do
    Nokotime.configure do |c|
      c.token = "valid_token"
      c.auth_type = :freckle_token
      c.max_concurrency = 5
    end
  end

  config.after(:each) do
    Nokotime.reset
  end
end
