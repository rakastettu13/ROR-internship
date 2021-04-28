# frozen_string_literal: true

class Station
  include InstanceCounter

  attr_reader :name, :train_list

  def initialize(name)
    @name = name
    validate!
    @train_list = []
    self.class.all.push(self)
    register_instance
  end

  def add(train)
    train_list.push(train)
  end

  def delete(train)
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
    { passenger: passenger, cargo: cargo }
  end

  def trains(&block)
    train_list.each { |train| block.call(train) }
  end

  def valid?
    validate!
    true
  rescue RuntimeError
    false
  end

  private

  attr_writer :train_list

  def validate!
    raise "Name can't be nil" if name.nil?
    raise 'Name should be at least 1 symbol' if name.empty?
  end
end
