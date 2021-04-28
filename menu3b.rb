# frozen_string_literal: true

module Menu3b
  def menu3b
    train = choose('train')
    loop do
      puts 'Введите 1 для назначения маршрута'
      puts 'Введите 2 для добавления вагона'
      puts 'Введите 3 для удаления вагона'
      puts 'Введите 4 для перемещения поезда вперед'
      puts 'Введите 5 для перемещения поезда назад'
      puts 'Введите 0 для возврата к предыдущему меню'
      index = gets.chomp
      case index
      when '0' then break
      when '1' then go_on_route(train)
      when '2' then add_railcar(train)
      when '3' then delete_railcar(train)
      when '4', '5' then go_on_station(train, index)
      else puts 'Попробуйте снова'
      end
    end
  end

  def go_on_route(train)
    route = choose('route')
    train.go(route)
  end

  def go_on_station(train, index)
    train.go_ahead if index == '4'
    train.go_back if index == '5'
  end

  def add_railcar(train)
    case train.type
    when 'cargo' then current_class = RailcarCargo
    when 'passenger' then current_class = RailcarPassenger
    end
    current_class.all.each_with_index do |railcar, index|
      puts "Введите #{index}, чтобы выбрать вагон вместимостью #{railcar.space}"
    end
    index = gets.to_i
    train.add(current_class.all[index])
  end

  def delete_railcar(train)
    train.railcars do |railcar, index|
      puts "Введите #{index}, чтобы удалить вагон вместимостью #{railcar.space}"
    end
    index = gets.to_i
    train.delete(train.railcar_list[index])
  end
end
