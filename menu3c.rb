# frozen_string_literal: true

module Menu3c
  def menu3c
    route = choose('route')
    validate!(route)
    loop do
      puts 'Введите 1 для добавления станции в маршрут'
      puts 'Введите 2 для удаления станции из маршрута'
      puts 'Введите 0 для возврата к предыдущему меню'
      case gets.chomp
      when '0' then break
      when '1' then route.add(choose('station'))
      when '2' then route.delete(choose('station'))
      else puts 'Попробуйте снова'
      end
    end
  rescue RuntimeError
    puts 'Индекс введен неверно. Попробуйте снова.'
  end
end
