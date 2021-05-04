# frozen_string_literal: true

module Menu1
  include Menu1a
  include Menu1b

  def menu1
    loop do
      puts 'Введите 1 для создания поезда'
      puts 'Введите 2 для создания вагона'
      puts 'Введите 3 для создания станции'
      puts 'Введите 4 для создания маршрута'
      puts 'Введите 0 для возврата к преддыдущему меню'
      puts 'Введите stop для завершения работы'
      case gets.chomp
      when 'stop' then exit
      when '0' then break
      when '1' then menu1a
      when '2' then menu1b
      when '3' then create_station
      when '4' then create_route
      else puts 'Попробуйте снова'
      end
    end
  end

  def create_station
    puts 'Для создания станции введите ее название'
    name = gets.chomp
    s = Station.new(name)
    puts "Создана станция #{s.name}"
  end

  def create_route
    first = choose('station', messege: 'Выберите начальную станцию')
    last = choose('station', messege: 'Выберите конечную станцию')

    r = Route.new(first, last)
    puts "Создан маршрут #{r.name}"
  rescue TypeError
    puts 'Индексы введены неверно. Попробуйте снова.'
  rescue RuntimeError
    puts 'Для создания маршрута нужны по крайней мере две станции. Перейдите в меню создания.'
  end
end
