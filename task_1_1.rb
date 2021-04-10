class Station
  attr_accessor :train_list
  attr_reader :name

  def initialize(name)
    @name = name
    @train_list = []
  end

  def add_train(train)
    train_list.push(train)
  end

  def delete_train(train)
    train_list.delete(train)
  end

  def train_type_list
    passenger = 0
    cargo = 0
    train_list.each do |n|
      if n.type == 'passenger'
        passenger += 1
      else
        cargo += 1
      end
    end
    "passenger: #{passenger}, cargo: #{cargo}"
  end
end

class Route
  attr_reader :station_list

  def initialize(first, last)
    @station_list = [first, last]
  end

  def add_station(new)
    station_list.insert(station_list.size - 1, new)
  end

  def delete_station(waste)
    station_list.delete(waste)
  end
end

class Train
  attr_accessor :railcar, :speed, :station_index, :current_station, :route
  attr_reader :type, :number

  def initialize(number, railcar, type)
    @number = number
    @type = type
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

  def go(new_route)
    self.route = new_route
    self.station_index = 0
    self.current_station = route.station_list[station_index]
  end

  def go_ahead
    self.station_index += 1
    self.current_station = route.station_list[station_index]
  end

  def go_back
    self.station_index -= 1
    self.current_station = route.station_list[station_index]
  end

  def next_station
    route.station_list[station_index + 1]
  end

  def previous_station
    route.station_list[station_index - 1]
  end
end
