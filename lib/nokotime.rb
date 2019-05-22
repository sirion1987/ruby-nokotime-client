require "dry-validation"
require "faraday"
require "faraday_middleware"

require "nokotime/authentication"
require "nokotime/configuration"
require "nokotime/connection"
require "nokotime/paginator"
require "nokotime/request/single_page"
require "nokotime/request/multiple_pages"
require "nokotime/validator/restricted_hash"
require "nokotime/validator/user_schema"
require "nokotime/validator/entry_schema"
require "nokotime/client/users"
require "nokotime/client/entries"

module Nokotime
  module_function

  def configure(&_block)
    yield configuration
  end

  def configuration
    @configuration || reset
  end

  def reset
    @configuration = Configuration.new
  end
end
