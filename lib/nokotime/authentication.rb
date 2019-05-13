module Nokotime
  module Authentication
    AUTHENTICATION_TYPE = [
      :noko_token
    ].freeze

    def valid_auth?(type)
      AUTHENTICATION_TYPE.include? type
    end

    def authorize_request(request)
      case auth_type
      when :noko_token
        request.headers["X-NokoToken"] = token
      end
    end

    private

    def token
      Nokotime.configuration.token
    end

    def auth_type
      Nokotime.configuration.auth_type
    end
  end
end
