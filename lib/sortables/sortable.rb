module Sortables
  module Sortable
    def self.included(base)
      base.extend ClassMethods
      base.send(:default_scope, :order => :position)
      base.send(:before_create, :set_minimum_position)
      base.attr_accessible :position
    end

    module ClassMethods
      def minimum_position
        (maximum(:position) || -1) + 1
      end
    end

    private
    def set_minimum_position
      return unless position.blank?
      self.position = self.class.minimum_position
    end
  end
end
