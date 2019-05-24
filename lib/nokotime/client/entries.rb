module Nokotime
  module Client
    class Entries
      ENDPOINT = "/v2/entries".freeze

      attr_reader :params

      def initialize(params = {})
        @params = params
      end

      def all
        multiple_pages.get(ENDPOINT, params: entry_params)
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

      def entry_params
        return params if validation.success?

        raise Errors::InvalidParams, validation.messages
      end

      def validation
        @validation ||= Validator::EntrySchema.validate(params)
      end
    end
  end
end
