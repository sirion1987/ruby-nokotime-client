module Nokotime
  module Validator
    module TagSchema
      TAG_SCHEMA = Dry::Validation.Schema do
        configure do
          config.namespace = :tag
          config.messages_file = File.join(__dir__, "validation.yml")

          predicates(RestrictedHash)

          def allowed_keys
            %i(name billable per_page)
          end
        end

        restricted_hash?(allowed_keys) do
          optional(:name).filled :str?
          optional(:billable).filled :bool?
          optional(:per_page).filled :int?
        end
      end

      def self.validate(attributes)
        TAG_SCHEMA.call(attributes)
      end
    end
  end
end
