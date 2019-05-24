module Nokotime
  module Validator
    module ProjectSchema
      PROJECT_SCHEMA = Dry::Validation.Schema do
        configure do
          config.namespace = :project
          config.messages_file = File.join(__dir__, "validation.yml")

          predicates(RestrictedHash)

          def allowed_keys
            %i(name
              project_group_ids
              billing_increment
              enabled
              billable
              per_page
            )
          end

          def valid_increment
              %w(1 5 6 10 15)
          end

          def valid_increment?(_options, values)
            values.split(",").all? do |value|
              valid_increment.include?(value)
            end
          end
        end

        restricted_hash?(allowed_keys) do
          optional(:name).filled :str?
          optional(:project_group_ids).filled :str?
          optional(:billing_increment).filled :str?
          optional(:billing_increment).filled(valid_increment?: {})
          optional(:enabled).filled :bool?
          optional(:billable).filled :bool?
          optional(:per_page).filled :int?
        end
      end

      def self.validate(attributes)
        PROJECT_SCHEMA.call(attributes)
      end
    end
  end
end
