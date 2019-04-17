require "simplecov"
require "bundler/setup"
require "nokotime"

Dir["./spec/support/**/*.rb"].sort.each { |file| require file }

SimpleCov.start do
  add_filter "/vendor/"
  add_filter "/tmp/"
  add_filter ".bundle/"
  add_filter "/spec/"
end

RSpec.configure do |config|
  config.expect_with :rspec do |c|
    c.syntax = :expect
  end
end
