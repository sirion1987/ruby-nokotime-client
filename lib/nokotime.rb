require "dry-validation"

require "nokotime/configuration"
require "nokotime/validator/restricted_hash"
require "nokotime/validator/user"
require "nokotime/client/users"

module Nokotime
  module_function

  def configure
    yield configuration if block_given?
  end

  def configuration
    @configuration || reset
  end

  def reset
    @configuration = Configuration.new
  end
end
