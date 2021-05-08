# frozen_string_literal: true

module Menu1a
  def menu1a
    loop do
      puts 'Введите 1 для создания грузового поезда'
      puts 'Введите 2 для создания пассажирского поезда'
      puts 'Введите 0 для возврата к преддыдущему меню'
      puts 'Введите stop для завершения работы'
      case gets.chomp
      when 'stop' then exit
      when '0' then break
      when '1' then create_train('cargo')
      when '2' then create_train('passenger')
      else puts 'Попробуйте снова'
      end
    end
  end

  def create_train(str)
    puts 'Для создания поезда введите его номер'
    puts "Допустимый формат: ***-**, где '*' - буква или число; дефис необязателен "
    number = gets.chomp
    t = TrainCargo.new(number) if str == 'cargo'
    t = TrainPassenger.new(number) if str == 'passenger'
    puts "Создан поезд №#{t.number}"
  rescue RuntimeError
    puts 'Недопустимый формат номера'
  end
end
