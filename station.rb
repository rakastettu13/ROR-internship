# frozen_string_literal: true

class Station
  attr_reader :name, :train_list

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
    { passenger: passenger, cargo: cargo }
  end

  private

  # эту переменную не должен изменять пользователь
  attr_writer :train_list
end