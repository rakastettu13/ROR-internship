# frozen_string_literal: true

class Railcar
  include CompanyName
  include InstanceCounter

  attr_reader :type, :occupied, :space

  @@all_types = []

  def self.all_types
    @@all_types
  end

  def initialize(space)
    @type = initial_type
    @space = space
    @occupied = 0
    validate!
    self.class.all.push(self)
    @@all_types.push(self)
  end

  def free
    space - occupied
  end

  def valid?
    validate!
    true
  rescue RuntimeError, NoMethodError
    false
  end

  protected

  attr_writer :type, :space, :occupied

  def initial_type
    'no type'
  end

  def occupy_space(value)
    @occupied += value if (occupied + value) <= space
  end

  def validate!
    raise "space can't be nil" if space.nil?
    raise 'space ​​must be greater than or equal to 0' if space.negative?
  end
end
