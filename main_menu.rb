# frozen_string_literal: true

class MainMenu
  include Menu1
  include Menu2
  include Menu3

  def start
    loop do
      puts 'Введите 1 для создания вагона, поезда, станции или маршрута'
      puts 'Введите 2 для получения информации о созданных объектах'
      puts 'Введите 3 для управления созданными объектами'
      puts 'Введите stop для завершения работы'
      case gets.chomp
      when 'stop' then exit
      when '1' then menu1
      when '2' then menu2
      when '3' then menu3
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
    return Station.all if class_name == 'station'
    return Train.all_types if class_name == 'train'
    return Route.all if class_name == 'route'
    return Railcar.all_types if class_name == 'railcar'
  end

  def print_list(class_name)
    case class_name
    when 'train'
      elements(class_name) { |train, index| puts "Введите #{index}, чтобы выбрать #{train.number}" }
    when 'railcar'
      elements(class_name) do |railcar, index|
        puts "Введите #{index}, чтобы выбрать вагон типа #{railcar.type} вместимостью #{railcar.space}"
      end
    when 'station', 'route'
      elements(class_name) { |element, index| puts "Введите #{index}, чтобы выбрать #{element.name}" }
    end
  end

  def elements(class_name, &block)
    list(class_name).each_with_index { |element, index| block.call(element, index) }
  end
end
