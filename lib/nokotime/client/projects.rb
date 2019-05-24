module Nokotime
  module Client
    class Projects
      ENDPOINT = "/v2/projects".freeze

      attr_reader :params

      def initialize(params = {})
        @params = params
      end

      def all
        multiple_pages.get(ENDPOINT, params: project_params)
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

      def project_params
        return params if validation.success?

        raise Errors::InvalidParams, validation.messages
      end

      def validation
        @validation ||= Validator::ProjectSchema.validate(params)
      end
    end
  end
end
