# frozen_string_literal: true

module Menu3
  include Menu3a
  include Menu3b
  include Menu3c

  def menu3
    loop do
      puts 'Введите 1 для управления вагонами'
      puts 'Введите 2 для управления поездами'
      puts 'Введите 3 для управления маршрутами'
      puts 'Введите 0 для возврата к предыдущему меню'
      puts 'Введите stop для завершения работы'
      case gets.chomp
      when 'stop' then exit
      when '0' then break
      when '1' then menu3a
      when '2' then menu3b
      when '3' then menu3c
      else puts 'Попробуйте снова'
      end
    end
  end
end
