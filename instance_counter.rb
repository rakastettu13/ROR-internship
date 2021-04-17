# frozen_string_literal: true

module InstanceCounter
  def self.included(base)
    base.extend ClassMethods
    base.send :include, InstanceMethods
  end

  module ClassMethods
    def instances
      class << self
        attr_accessor :instances
      end
      @instances = 0
    end
  end

  module InstanceMethods
    def register_instance
      self.class.instances += 1
    end
  end
end
