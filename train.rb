# frozen_string_literal: true

class Train
  include CompanyName
  include InstanceCounter
  include Validation

  attr_reader :type, :number, :route, :railcar_list, :speed

  NUMBER_FORMAT = /^[a-zA-z\d]{3}-?[a-zA-z\d]{2}$/.freeze

  validate(:format, :@number, NUMBER_FORMAT)
  validate(:non_negativity, :@speed)

  @@all_types = []

  def self.all_types
    @@all_types
  end

  def self.find(number)
    @@all_types.each { |train| return train if train.number == number }
    nil
  end

  def initialize(number)
    @number = number
    @speed = 0
    validate!
    @type = initial_type
    @railcar_list = []
    @@all_types.push(self)
    self.class.all.push(self)
    register_instance
  end

  def speed=(value)
    @speed = value
    validate!
  end

  def stop
    self.speed = 0
  end

  def add(railcar)
    railcar_list.push(railcar) if speed.zero? && (type == railcar.type)
  end

  def delete(railcar)
    railcar_list.delete(railcar) if speed.zero?
  end

  def go(new_route)
    self.route = new_route
    self.station_index = 0
    current_station.add(self)
  end

  def go_ahead
    return nil unless station_index != route.station_list.size - 1

    current_station.delete(self)
    next_station.add(self)
    self.station_index += 1
  end

  def go_back
    return nil unless station_index != 0

    current_station.delete(self)
    previous_station.add(self)
    self.station_index -= 1
  end

  def next_station
    route.station_list[station_index + 1] if station_index != route.station_list.size - 1
  end

  def current_station
    route.station_list[station_index]
  end

  def previous_station
    route.station_list[station_index - 1] if station_index != 0
  end

  def railcars(&block)
    railcar_list.each_with_index { |railcar, index| block.call(railcar, index) }
  end

  protected

  attr_accessor :station_index
  attr_writer :route, :ralcar_list

  def initial_type; end
end
