# frozen_string_literal: true

class Menu
  attr_reader :train_list, :station_list, :route_list

  def initialize
    @train_list = []
    @station_list = []
    @route_list = []
  end

  def create_train(str)
    puts 'Для создания поезда введите его номер'
    number = gets.chomp
    train_list.push(TrainCargo.new(number)) if str == 'cargo'
    train_list.push(TrainPassenger.new(number)) if str == 'passenger'
  end

  def create_station
    puts 'Для создания станции введите ее название'
    name = gets.chomp
    station_list.push(Station.new(name))
  end

  def create_route
    print_station_list
    puts 'Выберите начальную станцию'
    first_index = gets.to_i
    puts 'Выберите конечную станцию'
    last_index = gets.to_i
    route_list.push(Route.new(station_list[first_index], station_list[last_index]))
  end

  def choose_the_station
    print_station_list
    index = gets.to_i
    station_list[index]
  end

  def choose_the_route
    puts 'Список доступных маршрутов:'
    (0...route_list.size).each do |i|
      puts "Введите #{i}, чтобы выбрать маршрут #{route_list[i].name}"
    end
    index = gets.to_i
    route_list[index]
  end

  def choose_the_train
    puts 'Список доступных поездов:'
    (0...train_list.size).each do |i|
      puts "Введите #{i}, чтобы выбрать поезд № #{train_list[i].number}"
    end
    index = gets.to_i
    train_list[index]
  end

  private

  attr_writer :train_list, :station_list, :route_list

  def print_station_list
    puts 'Список доступных станций:'
    (0...station_list.size).each do |i|
      puts "Введите #{i}, чтобы выбрать #{station_list[i].name}"
    end
  end
end
