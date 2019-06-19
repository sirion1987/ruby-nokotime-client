module Nokotime
  class Error < StandardError
  end

  # configuration
  class ConfigurationError < Error; end

  # connection
  class ConnectionFailedError < Error; end
  class ResourceNotFoundError < Error; end
  class ClientError < Error; end

  # params
  class InvalidParamsError < Error; end
end
