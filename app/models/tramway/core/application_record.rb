require 'carrierwave/orm/activerecord'

module Tramway
  module Core
    class ApplicationRecord < ActiveRecord::Base
      self.abstract_class = true
      audited
      extend Enumerize

      state_machine :state, initial: :active do
        state :active
        state :removed

        event :remove do
          transition active: :remove
        end
      end

      scope :active, -> { where state: :active }

      # FIXME detect inhertited locales
      class << self
        def human_attribute_name(attribute_name, *args)
          excepted_attributes = %w( created_at updated_at state )
          if attribute_name.to_s.in? excepted_attributes
            I18n.t "activerecord.attributes.tramway/core/application_record.#{attribute_name}"
          else
            super attribute_name
          end
        end
      end
      # FIXME detect inhertited locales
      def human_state_name
        I18n.t "activerecord.state_machines.tramway/core/application_record.state.states.#{state}"
      end
    end
  end
end
