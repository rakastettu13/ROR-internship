# frozen_string_literal: true

module Validation
  def self.included(base)
    base.extend ClassMethods
    base.send :include, InstanceMethods
  end

  module ClassMethods
    def validations
      @validations ||= []
    end

    def validate(type, attribute, *parameters)
      hash = { type: type, attribute: attribute, parameters: parameters }
      validations.push(hash) unless validations.include?(hash)
    end
  end

  module InstanceMethods
    def validate!
      self.class.validations.each do |validation|
        send(validation[:type].to_sym, validation[:attribute], validation[:parameters])
      end
    end

    def presence(attribute, _parameters)
      raise "'Presence' validation failed: value can't be nil. " if send(attribute).nil?
      raise "'Presence' validation failed: value should be at least 1 symbol." if send(attribute).empty?
    end

    def non_negativity(attribute, _parameters)
      raise "'Non_negativity' validation failed: value can't be nil" if send(attribute).nil?
      raise "'Non_negativity' validation failed: value must be greater than or equal to 0" if send(attribute).negative?
    end

    def format(attribute, regexp)
      raise "'Format' validation failed: value has invalid format" if send(attribute) !~ regexp[0]
    end

    def type(attribute, attr_type)
      raise "Type' validation failed: value type is not the same as expected" if send(attribute).class != attr_type[0]
    end

    def valid?
      validate!
      true
    rescue RuntimeError
      false
    end
  end
end
