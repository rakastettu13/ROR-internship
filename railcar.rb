# frozen_string_literal: true

class Railcar
  include CompanyName
  include InstanceCounter
  include Validation

  attr_reader :type, :occupied, :space

  @@all_types = []

  def self.all_types
    @@all_types
  end

  def initialize(space)
    validate!(space)
    @type = initial_type
    @space = space
    @occupied = 0
    self.class.all.push(self)
    @@all_types.push(self)
  end

  def free
    space - occupied
  end

  protected

  attr_writer :type, :space, :occupied

  def initial_type;  end

  def occupy_space(value)
    validate!(value)
    validate!(space - value - occupied)
    @occupied += value
  end
end
