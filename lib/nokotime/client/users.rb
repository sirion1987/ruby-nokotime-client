module Nokotime
  module Client
    class Users
      module Errors
        class InvalidParams < StandardError; end
      end

      ENDPOINT = "/v2/users".freeze

      attr_reader :params

      def initialize(params = {})
        @params = params
      end

      def all
        user_params
      end

      def show(id)
      end

      private

      def user_params
        return if validation.success?

        raise Errors::InvalidParams, validation.messages
      end

      def validation
        @validation ||= Validator::User::UserSchema.call(params)
      end
    end
  end
end
