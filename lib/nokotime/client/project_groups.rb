module Nokotime
  module Client
    class ProjectGroups
      ENDPOINT = "/v2/project_groups".freeze

      attr_reader :params

      def initialize(params = {})
        @params = params
      end

      def all
        multiple_pages.get(ENDPOINT, params: project_group_params)
      end

      private

      def multiple_pages
        @multiple_pages ||= Request::MultiplePages.new
      end

      def project_group_params
        return params if validation.success?

        raise InvalidParamsError, validation.messages
      end

      def validation
        @validation ||= Validator::ProjectGroupSchema.validate(params)
      end
    end
  end
end
