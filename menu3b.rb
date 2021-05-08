# frozen_string_literal: true

module Menu3b
  def menu3b
    train = choose('train')
    validate!(train)

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
  rescue RuntimeError, NoMethodError
    puts 'Неверно введен индекс. Попробуйте снова'
  end

  def go_on_route(train)
    route = choose('route')
    train.go(route)
    puts "Поезду #{train.number} Назначен маршрут #{route.name}"
  rescue RuntimeError
    puts 'Нет доступных маршрутов. Перейдите в меню создания.'
  end

  def go_on_station(train, index)
    go = train.go_ahead if index == '4'
    go = train.go_back if index == '5'
    puts 'Перемещение удалось' if go
    puts 'Перемещение не удалось' unless go
  rescue NoMethodError
    puts 'Движение невозможно. Назначьте поезду маршрут.'
  end

  def add_railcar(train)
    case train.type
    when 'cargo' then railcar = choose('railcar_cargo')
    when 'passenger' then railcar = choose('railcar_passenger')
    end
    train.add(railcar)
    puts 'Вагон добавлен'
  rescue RuntimeError
    puts 'Нет доступных вагонов. Перейдите в меню создания.'
  end

  def delete_railcar(train)
    if train.railcar_list.size.zero?
      puts 'Нет вагонов для удаления'
    else
      train.railcars do |railcar, index|
        puts "Введите #{index}, чтобы удалить вагон вместимостью #{railcar.space}"
      end
      index = gets.to_i
      train.delete(train.railcar_list[index])
      puts 'Вагон удален'
    end
  end
end
