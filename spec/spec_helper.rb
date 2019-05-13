require "simplecov"
require "simplecov-console"

SimpleCov.start do
  add_filter "/vendor/"
  add_filter "/tmp/"
  add_filter ".bundle/"
  add_filter "/spec/"
end

require "bundler/setup"
require "dotenv"
require "nokotime"

Dir["./spec/support/**/*.rb"].sort.each { |file| require file }

Dotenv.load(".env.test")

RSpec.configure do |config|
  config.expect_with :rspec do |c|
    c.syntax = :expect
  end
end
