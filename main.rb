# frozen_string_literal: true

require_relative 'validation'
require_relative 'company_name'
require_relative 'instance_counter'
require_relative 'railcar'
require_relative 'railcar_cargo'
require_relative 'railcar_passenger'
require_relative 'station'
require_relative 'route'
require_relative 'train'
require_relative 'train_cargo'
require_relative 'train_passenger'
require_relative 'menu1a'
require_relative 'menu1b'
require_relative 'menu1'
require_relative 'menu2'
require_relative 'menu3a'
require_relative 'menu3b'
require_relative 'menu3c'
require_relative 'menu3'
require_relative 'main_menu'
simulator = MainMenu.new
simulator.start
