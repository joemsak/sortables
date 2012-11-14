require "sortables/version"
require "sortables/sortable"

module Sortables
  module ClassMethods
    def sortable
      send :include, Sortables::Sortable
    end
  end

  if defined?(ActiveRecord::Base)
    ActiveRecord::Base.extend Sortables::ClassMethods
  end
end
