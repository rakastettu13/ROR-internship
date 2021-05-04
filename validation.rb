# frozen_string_literal: true

module Validation
  def self.included(base)
    base.extend ClassMethods
    base.send :include, InstanceMethods
  end

  module ClassMethods
    def validate(attribute, validation, regexp: '', attr_type: '')
      case validation
      when 'presence'
        presence(attribute)
      when 'non_negativity'
        non_negativity(attribute)
      when 'format'
        format(attribute, regexp)
      when 'type'
        type(attribute, attr_type)
    end

    def presence(attribute)
      raise "'Presence' validation failed: value can't be nil. " if attribute.nil?
      raise "'Presence' validation failed: value should be at least 1 symbol." if attribute.empty?
    end

    def non_negativity(attribute)
      raise "'Non_negativity' validation failed: value can't be nil" if attribute.nil?
      raise "'Non_negativity' validation failed: value must be greater than or equal to 0" if attribute.negative?
    end

    def format(attribute, regexp)
      raise "'Format' validation failed: value has invalid format" if attribute !~ regexp
    end

    def type(attribute, attr_type)
      raise "Type' validation failed:alue type is not the same as expected" if attribute.class != attr_type
    end
  end

  module InstanceMethods
    def validate!(attribute, regexp: '', attr_type: '')
      if instance_of?(Railcar) || instance_of?(RailcarCargo) || instance_of?(RailcarPassenger)
        self.class.validate(attribute, 'non_negativity')
      elsif instance_of?(Station)
        self.class.validate(attribute, 'presence')
        self.class.validate(attribute, 'format', regexp: regexp)
      elsif instance_of?(Route)
        self.class.validate(attribute, 'type', attr_type: attr_type)
      end
    end

    def valid?(attribute, regexp: '', attr_type: '')
      validate!(attribute, regexp: regexp, attr_type: attr_type)
      true
    rescue RuntimeError
      false
    end
  end
end
