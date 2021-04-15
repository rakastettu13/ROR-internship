# frozen_string_literal: true

module Menu3
  def menu3
    train = choose('train')
    loop do
      puts 'Введите 1 для назначения маршрута'
      puts 'Введите 2 для добавления вагона'
      puts 'Введите 3 для удаления вагона'
      puts 'Введите 4 для перемещения поезда вперед'
      puts 'Введите 5 для перемещения поезда назад'
      puts 'Введите 0 для возврата к предыдущему меню'
      puts 'Введите stop для завершения работы'
      case gets.chomp
      when 'stop' then exit
      when '0' then break
      when '1' then go_on_route(train)
      when '2' then add_railcar(train)
      when '3' then delete_railcar(train)
      when '4' then train.go_ahead
      when '5' then train.go_back
      else puts 'Попробуйте снова'
      end
    end
  end

  def go_on_route(train)
    route = choose('route')
    train.go(route)
  end

  def add_railcar(train)
    train.add_railcar(RailcarPassenger.new) if train.type == 'passenger'
    train.add_railcar(RailcarCargo.new) if train.type == 'cargo'
  end

  def delete_railcar(train)
    train.delete_railcar(train.railcar_list.last)
  end
end
