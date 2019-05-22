module Nokotime
  # rubocop:disable Metrics/ModuleLength
  module Validator
    # rubocop:disable Metrics/BlockLength
    module EntrySchema
      ENTRY_SCHEMA = Dry::Validation.Schema do
        configure do
          config.namespace = :entry
          config.messages_file = File.join(__dir__, "validation.yml")

          predicates(RestrictedHash)

          def valid_tag_filter_type
            %w(and combination of)
          end

          # rubocop:disable Metrics/MethodLength
          def allowed_keys
            %i(
              user_ids
              description
              project_ids
              tag_ids
              tag_filter_type
              invoice_ids
              import_ids
              from
              to
              invoiced
              invoiced_at_from
              invoiced_at_to
              updated_from
              updated_to
              billable
              approved_at_from
              approved_at_to
              approved_by_ids
              per_page
            )
          end
          # rubocop:enable Metrics/MethodLength
        end

        restricted_hash?(allowed_keys) do
          optional(:user_ids).filled :str?
          optional(:description).filled :str?
          optional(:project_ids).filled :str?
          optional(:tag_ids).filled :str?
          optional(:tag_filter_type).filled :str?
          optional(:tag_filter_type).
            value(included_in?: valid_tag_filter_type)
          optional(:invoice_ids).filled :str?
          optional(:import_ids).filled :str?
          optional(:from).filled :str?
          optional(:to).filled :str?
          optional(:invoiced).filled :bool?
          optional(:invoiced_at_from).filled :str?
          optional(:invoiced_at_to).filled :str?
          optional(:updated_from).filled :str?
          optional(:updated_to).filled :str?
          optional(:billable).filled :bool?
          optional(:approved_at_from).filled :str?
          optional(:approved_at_to).filled :str?
          optional(:approved_by_ids).filled :str?
          optional(:per_page).filled :int?
        end
      end
      # rubocop:enable Metrics/BlockLength

      def self.validate(attributes)
        ENTRY_SCHEMA.(attributes)
      end
    end
    # rubocop:enable Metrics/ModuleLength
  end
end
