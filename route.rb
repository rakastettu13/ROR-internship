# frozen_string_literal: true

class Route
  include InstanceCounter
  include Validation

  attr_reader :station_list, :name
  attr_accessor :first, :last

  validate(:type, :@first, Station)
  validate(:type, :@last, Station)
  def initialize(first, last)
    @first = first
    @last = last
    validate!
    @station_list = [@first, @last]
    @name = "#{first.name} -- #{last.name}"
    self.class.all.push(self)
    register_instance
  end

  def add(new)
    station_list.insert(station_list.size - 1, new)
  end

  def delete(station)
    station_list.delete(station)
  end
end
