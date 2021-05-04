# frozen_string_literal: true

class Station
  include InstanceCounter
  include Validation

  attr_reader :name, :train_list

  NAME_FORMAT = //.freeze

  def initialize(name)
    validate!(name, regexp: NAME_FORMAT)
    @name = name
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

  private

  attr_writer :train_list
end
