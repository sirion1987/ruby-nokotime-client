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
        multiple_pages.get(ENDPOINT, params: user_params)
      end

      def show(id)
        single_page.get("#{ENDPOINT}/#{id}")
      end

      private

      def multiple_pages
        @multiple_pages ||= Request::MultiplePages.new
      end

      def single_page
        @single_page ||= Request::SinglePage.new
      end

      def user_params
        return params if validation.success?

        raise Errors::InvalidParams, validation.messages
      end

      def validation
        @validation ||= Validator::UserSchema.validate(params)
      end
    end
  end
end
