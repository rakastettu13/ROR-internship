# frozen_string_literal: true

module Menu3a
  def menu3a
    loop do
      puts 'Введите 1, чтобы занять место/объем в вагоне'
      puts 'Введите 0 для возврата к преддыдущему меню'
      case gets.chomp
      when '0' then break
      when '1' then take_up_space
      else puts 'Попробуйте снова'
      end
    end
  end

  def take_up_space
    railcar = choose('railcar')
    case railcar.type
    when 'cargo'
      puts "Свободный объем: #{railcar.free}. Введите величину объема, который необходимо занять"
      volume = gets.chomp
      railcar.occupy(volume.to_f)
    when 'passenger'
      railcar.occupy
    end
  end
end
