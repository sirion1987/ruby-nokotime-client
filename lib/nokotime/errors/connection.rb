module Nokotime
  module Errors
    class ConnectionFailed < StandardError; end
    class ResourceNotFound < StandardError; end
    class ClientError < StandardError; end
  end
end
