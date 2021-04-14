# frozen_string_literal: true

require_relative 'railcar'
require_relative 'railcar_cargo'
require_relative 'railcar_passenger'
require_relative 'route'
require_relative 'station'
require_relative 'train'
require_relative 'train_cargo'
require_relative 'train_passenger'
require_relative 'menu'
simulator = Menu.new
loop do
  puts 'Введите 1 для создания поезда, станции или маршрута'
  puts 'Введите 2 для получения информации о созданных объектах'
  puts 'Введите 3 для управления поездами'
  puts 'Введите 4 для управления маршрутами'
  puts 'Введите stop для завершения работы'
  case gets.chomp
  when 'stop' then exit
  when '1'
    loop do
      puts 'Введите 1 для создания пассажирского поезда'
      puts 'Введите 2 для создания грузового поезда'
      puts 'Введите 3 для создания станции'
      puts 'Введите 4 для создания маршрута'
      puts 'Введите 0 для возврата к преддыдущему меню'
      puts 'Введите stop для завершения работы'
      case gets.chomp
      when '0' then break
      when '1' then simulator.create_train('passenger')
      when '2' then simulator.create_train('cargo')
      when '3' then simulator.create_station
      when '4' then simulator.create_route
      when 'stop' then exit
      else puts 'Попробуйте снова'
      end
    end
  when '2'
    loop do
      puts 'Введите 1 для просмотра списка станций маршрута'
      puts 'Введите 2 для просмотра списка поездов на станции'
      puts 'Введите 0 для возврата в предыдущее меню'
      puts 'Введите stop для завершения работы'
      case gets.chomp
      when '0' then break
      when '1'
        route = simulator.choose_the_route
        puts 'Список станций:'
        route.station_list.each do |station|
          puts station.name
        end
      when '2'
        station = simulator.choose_the_station
        puts 'Список поездов:'
        station.train_list.each do |train|
          puts train.number
        end
      when 'stop' then exit
      else puts 'Попробуйте снова'
      end
    end
  when '3'
    train = simulator.choose_the_train
    loop do
      puts 'Введите 1 для назначения маршрута'
      puts 'Введите 2 для добавления вагона'
      puts 'Введите 3 для удаления вагона'
      puts 'Введите 4 для перемещения поезда вперед'
      puts 'Введите 5 для перемещения поезда назад'
      puts 'Введите 0 для возврата к предыдущему меню'
      puts 'Введите stop для завершения работы'
      case gets.chomp
      when '0' then break
      when '1'
        route = simulator.choose_the_route
        train.go(route)
      when '2'
        train.add_railcar(RailcarPassenger.new) if train.type == 'passenger'
        train.add_railcar(RailcarCargo.new) if train.type == 'cargo'
      when '3' then train.delete_railcar(train.railcar_list.last)
      when '4' then train.go_ahead
      when '5' then train.go_back
      when 'stop' then exit
      else puts 'Попробуйте снова'
      end
    end
  when '4'
    route = simulator.choose_the_route
    loop do
      puts 'Введите 1 для добавления станции в маршрут'
      puts 'Введите 2 для удаления станции из маршрута'
      puts 'Введите 0 для возврата к предыдущему меню'
      puts 'Введите stop для завершения работы'
      case gets.chomp
      when '0' then break
      when '1' then route.add_station(simulator.choose_the_station)
      when '2' then route.delete_station(simulator.choose_the_station)
      when 'stop' then exit
      end
    end
  else puts 'Попробуйте снова'
  end
end
