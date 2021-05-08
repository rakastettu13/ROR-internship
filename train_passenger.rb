# frozen_string_literal: true

class TrainPassenger < Train
  validate(:format, :@number, NUMBER_FORMAT)
  validate(:non_negativity, :@speed)

  protected

  def initial_type
    'passenger'
  end
end
