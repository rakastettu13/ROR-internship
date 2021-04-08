class Station
  attr_accessor :train_list, :train_type_list
  attr_reader :name

  def initialize(name)
    @name = name
    self.train_list = []
    self.train_type_list = { 'passenger' => 0, 'cargo' => 0 }
  end

  def add_train(train)
    train_list.push(train.number)
    if train.type == 'passenger'
      train_type_list['passenger'] += 1
    else
      train_type_list['cargo'] += 1
    end
  end

  def delete_train(train)
    train_list.delete(train.number)
    if train.type == 'passenger'
      train_type_list['passenger'] -= 1
    else
      train_type_list['cargo'] -= 1
    end
  end
end

class Route
  attr_reader :station_list

  def initialize(first, last)
    @station_list = [first.name, last.name]
  end

  def add_station(new)
    station_list.insert(station_list.size - 1, new.name)
  end

  def delete_station(waste)
    station_list.delete(waste.name)
  end
end

class Train
  attr_accessor :railcar, :speed, :station_list, :station_index,
                :current_station, :previous_station, :next_station
  attr_reader :type, :number

  def initialize(number, railcar, type = 0)
    @number = number
    @type = if type.zero?
              'passenger'
            else
              'cargo'
            end
    @railcar = railcar
    @speed = 0
  end

  def stop
    self.speed = 0
  end

  def add_railcar
    if speed.zero?
      self.railcar += 1
    else
      puts 'It need to stop the train'
    end
  end

  def delete_railcar
    if speed.zero?
      self.railcar -= 1
    else
      puts 'It need to stop the train'
    end
  end

  def go(route)
    self.station_list = route.station_list
    self.station_index = 0
    self.next_station = station_list[station_index + 1]
    self.current_station = station_list[station_index]
  end

  def go_ahead
    self.station_index += 1
    self.next_station = station_list[station_index + 1]
    self.previous_station = station_list[station_index - 1]
    self.current_station = station_list[station_index]
  end

  def go_back
    self.station_index -= 1
    self.next_station = station_list[station_index + 1]
    self.previous_station = station_list[station_index - 1]
    self.current_station = station_list[station_index]
  end
end
