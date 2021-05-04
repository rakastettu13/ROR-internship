# frozen_string_literal: true

class Route
  include InstanceCounter
  include Validation

  attr_reader :station_list, :name

  def initialize(first, last)
    validate!(first, attr_type: Station)
    validate!(last, attr_type: Station)
    @station_list = [first, last]
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
