# frozen_string_literal: true

class Railcar
  include CompanyName
  include InstanceCounter
  include Validation

  attr_reader :type, :occupied, :space

  validate(:non_negativity, :@space)
  @@all_types = []

  def self.all_types
    @@all_types
  end

  def initialize(space)
    @type = initial_type
    @space = space
    validate!
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
    @occupied += value if (occupied + value) <= space && value >= 0
  end
end
