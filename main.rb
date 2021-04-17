# frozen_string_literal: true

require_relative 'railcar'
require_relative 'railcar_cargo'
require_relative 'railcar_passenger'
require_relative 'route'
require_relative 'station'
require_relative 'train'
require_relative 'train_cargo'
require_relative 'train_passenger'
require_relative 'menu1'
require_relative 'menu2'
require_relative 'menu3'
require_relative 'menu4'
require_relative 'main_menu'
simulator = MainMenu.new
simulator.start
