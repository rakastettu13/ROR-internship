# frozen_string_literal: true

module Menu2
  def menu2
    loop do
      puts 'Введите 1 для просмотра списка станций маршрута'
      puts 'Введите 2 для просмотра списка поездов на станции'
      puts 'Введите 0 для возврата в предыдущее меню'
      puts 'Введите stop для завершения работы'
      case gets.chomp
      when 'stop' then exit
      when '0' then break
      when '1' then route_station_list
      when '2' then station_train_list
      else puts 'Попробуйте снова'
      end
    end
  end

  def route_station_list
    route = choose('route')
    puts 'Список станций:'
    route.station_list.each { |station| puts station.name }
  end

  def station_train_list
    station = choose('station')
    puts 'Список поездов:'
    station.train_list.each { |train| puts train.number }
  end
end
