# frozen_string_literal: true

class RailcarCargo < Railcar
  def volume
    space
  end

  def occupy(value)
    occupy_space(value)
  end

  protected

  def initial_type
    'cargo'
  end
end
