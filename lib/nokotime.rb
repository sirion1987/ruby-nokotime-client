require "nokotime/configuration"

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
