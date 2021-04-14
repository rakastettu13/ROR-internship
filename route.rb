# frozen_string_literal: true

class Route
  attr_reader :station_list

  def initialize(first, last)
    @station_list = [first, last]
  end

  def add_station(new)
    station_list.insert(station_list.size - 1, new)
  end

  def delete_station(waste)
    station_list.delete(waste)
  end
end
