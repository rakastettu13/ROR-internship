# frozen_string_literal: true

module Menu4
  def menu4
    route = choose('route')
    loop do
      puts 'Введите 1 для добавления станции в маршрут'
      puts 'Введите 2 для удаления станции из маршрута'
      puts 'Введите 0 для возврата к предыдущему меню'
      puts 'Введите stop для завершения работы'
      case gets.chomp
      when 'stop' then exit
      when '0' then break
      when '1' then route.add_station(choose('station'))
      when '2' then route.delete_station(choose('station'))
      end
    end
  end
end
