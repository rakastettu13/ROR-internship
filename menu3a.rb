# frozen_string_literal: true

module Menu3a
  def menu3a
    railcar = choose('railcar')
    validate!(railcar)
    loop do
      puts 'Введите 1, чтобы занять место/объем в вагоне'
      puts 'Введите 0 для возврата к преддыдущему меню'
      case gets.chomp
      when '0' then break
      when '1' then take_up_space(railcar)
      else puts 'Попробуйте снова'
      end
    end
  rescue RuntimeError
    puts 'Индекс введен неверно. Попробуйте снова.'
  end

  def take_up_space(railcar)
    case railcar.type
    when 'cargo' then cargo(railcar)
    when 'passenger' then passenger(railcar)
    end
  end

  def cargo(railcar)
    puts "Свободный объем: #{railcar.free}. Введите величину объема, который необходимо занять"
    volume = gets.chomp
    if railcar.occupy(volume.to_f)
      puts "Объем занят. Свободный объем #{railcar.free}"
    else
      puts 'Не удалось занять объем. Весь объем занят или введено некорректное значение.'
    end
  end

  def passenger(railcar)
    if railcar.occupy
      puts "Место занято. Свободных мест #{railcar.free}"
    else
      puts 'Не удалось занять место. Свободных мест нет'
    end
  end
end
