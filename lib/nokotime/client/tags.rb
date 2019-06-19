module Nokotime
  module Client
    class Tags
      ENDPOINT = "/v2/tags".freeze

      attr_reader :params

      def initialize(params = {})
        @params = params
      end

      def all
        multiple_pages.get(ENDPOINT, params: tag_params)
      end

      private

      def multiple_pages
        @multiple_pages ||= Request::MultiplePages.new
      end

      def tag_params
        return params if validation.success?

        raise InvalidParamsError, validation.messages
      end

      def validation
        @validation ||= Validator::TagSchema.validate(params)
      end
    end
  end
end
