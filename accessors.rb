# frozen_string_literal: true

module Accessors
  def attr_accessor_with_history(*names)
    names.each do |name|
      var_history = "@#{name}_history".to_sym
      define_method("#{name}_history".to_sym) { instance_variable_get(var_history) }
      define_method(name) do
        instance_variable_set(var_history, []) unless instance_variable_get(var_history)
        instance_variable_get(var_history).last
      end
      define_method("#{name}=".to_sym) do |value|
        instance_variable_set(var_history, []) unless instance_variable_get(var_history)
        instance_variable_get(var_history).push(value)
      end
    end
  end

  def strong_attr_accessor(name, type)
    var_name = "@#{name}".to_sym
    define_method(name) { instance_variable_get(var_name) }
    define_method("#{name}=".to_sym) do |value|
      raise 'The value type is not the same as expected' if value.class != type

      instance_variable_set(var_name, value)
    end
  end
end
