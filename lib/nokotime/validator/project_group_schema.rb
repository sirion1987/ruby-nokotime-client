module Nokotime
  module Validator
    module ProjectGroupSchema
      PROJECT_GROUP_SCHEMA = Dry::Validation.Schema do
        configure do
          config.namespace = :project_group
          config.messages_file = File.join(__dir__, "validation.yml")

          predicates(RestrictedHash)

          def allowed_keys
            %i(name project_ids per_page)
          end
        end

        restricted_hash?(allowed_keys) do
          optional(:name).filled :str?
          optional(:project_ids).filled :str?
          optional(:per_page).filled :int?
        end
      end

      def self.validate(attributes)
        PROJECT_GROUP_SCHEMA.call(attributes)
      end
    end
  end
end
