# frozen_string_literal: true

class TrainCargo < Train
  validate(:format, :@number, NUMBER_FORMAT)
  validate(:non_negativity, :@speed)

  protected

  def initial_type
    'cargo'
  end
end
