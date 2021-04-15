# frozen_string_literal: true

class MainMenu
  attr_accessor :train_list, :station_list, :route_list

  def initialize
    @train_list = []
    @station_list = []
    @route_list = []
  end

  include Menu1
  include Menu2
  include Menu3
  include Menu4

  def start
    loop do
      puts 'Введите 1 для создания поезда, станции или маршрута'
      puts 'Введите 2 для получения информации о созданных объектах'
      puts 'Введите 3 для управления поездами'
      puts 'Введите 4 для управления маршрутами'
      puts 'Введите stop для завершения работы'
      case gets.chomp
      when 'stop' then exit
      when '1' then menu1
      when '2' then menu2
      when '3' then menu3
      when '4' then menu4
      else puts 'Попробуйте снова'
      end
    end
  end

  private

  def choose(class_name)
    print_list(class_name)
    index = gets.to_i
    list(class_name)[index]
  end

  def list(class_name)
    return station_list if class_name == 'station'
    return train_list if class_name == 'train'
    return route_list if class_name == 'route'
  end

  def print_list(class_name)
    (0...list(class_name).size).each do |i|
      puts "Введите #{i}, чтобы выбрать #{list(class_name)[i].name}" if %w[station route].include?(class_name)
      puts "Введите #{i}, чтобы выбрать #{list(class_name)[i].number}" if class_name == 'train'
    end
  end
end
