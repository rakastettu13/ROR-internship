# frozen_string_literal: true

class RailcarPassenger < Railcar
  def seats
    space
  end

  def occupy
    occupy_space(1)
  end

  protected

  def initial_type
    'passenger'
  end
end
