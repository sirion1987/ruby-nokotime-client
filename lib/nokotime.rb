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
require "nokotime/validator/user"
require "nokotime/client/users"

module Nokotime
  def configure(&block)
    yield configuration
  end
  module_function :configure

  def configuration
    @configuration || reset
  end
  module_function :configuration

  def reset
    @configuration = Configuration.new
  end
  module_function :reset
end
