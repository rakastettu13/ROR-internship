# frozen_string_literal: true

module Menu1b
  def menu1b
    loop do
      puts 'Введите 1 для создания грузового вагона'
      puts 'Введите 2 для создания пассажирского вагона'
      puts 'Введите 0 для возврата к преддыдущему меню'
      puts 'Введите stop для завершения работы'
      case gets.chomp
      when 'stop' then exit
      when '0' then break
      when '1' then create_railcar('cargo')
      when '2' then create_railcar('passenger')
      else puts 'Попробуйте снова'
      end
    end
  end

  def create_railcar(str)
    case str
    when 'cargo'
      puts 'Для создания грузового вагона введите его объем'
      volume = gets.chomp
      r = RailcarCargo.new(volume.to_f)
    when 'passenger'
      puts 'Для создания пассажирского вагона введите количество мест'
      seats = gets.chomp
      r = RailcarPassenger.new(seats.to_i)
    end
    puts "Создан вагон типа #{r.type} вместимостью #{r.space}"
  rescue RuntimeError
    puts 'Введено некорректное значение. Попробуйте снова.'
  end
end
