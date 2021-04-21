# frozen_string_literal: true

class Railcar
  include CompanyName

  attr_reader :type

  def initialize
    @type = initial_type
  end

  protected

  # пользователь не должен изменять тип вагона
  attr_writer :type

  def initial_type; end
end
