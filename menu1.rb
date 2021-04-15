# frozen_string_literal: true

module Menu1
  def menu1
    loop do
      puts 'Введите 1 для создания пассажирского поезда'
      puts 'Введите 2 для создания грузового поезда'
      puts 'Введите 3 для создания станции'
      puts 'Введите 4 для создания маршрута'
      puts 'Введите 0 для возврата к преддыдущему меню'
      puts 'Введите stop для завершения работы'
      case gets.chomp
      when 'stop' then exit
      when '0' then break
      when '1' then create_train('passenger')
      when '2' then create_train('cargo')
      when '3' then create_station
      when '4' then create_route
      else puts 'Попробуйте снова'
      end
    end
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
    print_list('station')
    puts 'Выберите начальную станцию'
    first_index = gets.to_i
    puts 'Выберите конечную станцию'
    last_index = gets.to_i
    route_list.push(Route.new(station_list[first_index], station_list[last_index]))
  end
end
