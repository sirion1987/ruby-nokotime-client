module Nokotime
  module Validator
    module UserSchema
      USER_SCHEMA = Dry::Validation.Schema do
        EMAIL_REGEX = /\A[^@\s]+@[^@\s]+\z/.freeze

        configure do
          config.namespace = :user
          config.messages_file = File.join(__dir__, "validation.yml")

          predicates(RestrictedHash)

          def valid_roles
            %w(supervisor leader coworker contractor)
          end

          def valid_states
            %w(disabled pending active suspended)
          end

          def allowed_keys
            %i(name email role state per_page)
          end
        end

        restricted_hash?(allowed_keys) do
          optional(:name).filled :str?
          optional(:email).filled :str?
          optional(:email).value(format?: EMAIL_REGEX)
          optional(:role).value(included_in?: valid_roles)
          optional(:state).value(included_in?: valid_states)
          optional(:per_page).filled :int?
        end
      end

      def self.validate(attributes)
        USER_SCHEMA.call(attributes)
      end
    end
  end
end
