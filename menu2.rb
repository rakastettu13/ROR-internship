# frozen_string_literal: true

module Menu2
  def menu2
    loop do
      puts 'Введите 1 для просмотра списка станций маршрута'
      puts 'Введите 2 для просмотра списка поездов на станции'
      puts 'Введите 3 для просмотра списка вагонов поезда'
      puts 'Введите 0 для возврата в предыдущее меню'
      puts 'Введите stop для завершения работы'
      case gets.chomp
      when 'stop' then exit
      when '0' then break
      when '1' then route_station_list
      when '2' then station_train_list
      when '3' then train_railcar_list
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
    puts 'Список поездов (номер, тип, количество вагонов):'
    station.trains { |train| puts "#{train.number} \t #{train.type} \t #{train.railcar_list.size}" }
  end

  def train_railcar_list
    train = choose('train')
    puts 'Список вагонов (номер, тип, мест занято, мест свободно)' if train.type == 'passenger'
    puts 'Список вагонов (номер, тип, занятый объем, свободный объем)' if train.type == 'cargo'
    train.railcars { |railcar, index| puts "#{index} \t #{railcar.type} \t  #{railcar.occupied} \t #{railcar.free}" }
  end
end
