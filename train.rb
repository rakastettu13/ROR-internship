# frozen_string_literal: true

class Train
  include CompanyName
  include InstanceCounter

  attr_accessor :speed
  attr_reader :type, :number, :route, :railcar_list

  @@all = []

  def self.all
    @@all
  end

  def self.find(number)
    @@all.each { |train| return train if train.number == number }
    nil
  end

  def initialize(number)
    @number = number
    @type = initial_type
    @railcar_list = []
    @speed = 0
    @@all.push(self)
    register_instance
  end

  def stop
    self.speed = 0
  end

  def add_railcar(railcar)
    railcar_list.push(railcar) if speed.zero? && (type == railcar.type)
  end

  def delete_railcar(railcar)
    railcar_list.delete(railcar) if speed.zero?
  end

  def go(new_route)
    self.route = new_route
    self.station_index = 0
    current_station.add_train(self)
  end

  def go_ahead
    return nil unless station_index != route.station_list.size - 1

    current_station.delete_train(self)
    next_station.add_train(self)
    self.station_index += 1
  end

  def go_back
    return nil unless station_index != 0

    current_station.delete_train(self)
    previous_station.add_train(self)
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

  protected

  # следующие переменные (методы) не должен изменять (использовать) пользователь
  attr_accessor :station_index
  attr_writer :route, :ralcar_list

  def initial_type; end
end
