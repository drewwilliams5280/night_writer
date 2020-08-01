require './lib/file_reader'
require 'csv'

class NightReader

  attr_reader :reader
  def initialize
    @reader = FileReader.new
  end

  def initial_output
    "Created '#{ARGV[1]}' containing #{(@reader.read.size / 6) - (@reader.read.size / 6 / 80)} characters"
  end

  def translate_braille_file
    english_characters = ""
    braille = @reader.read.delete("\n")
    (braille.size / 6).times do |num|
      braille1 = braille[num * 2]
      braille2 = braille[num * 2 + 1]
      braille3 = braille[num * 2 + 80]
      braille4 = braille[num * 2 + 81]
      braille5 = braille[num * 2 + 160]
      braille6 = braille[num * 2 + 161]
      english_characters += @reader.braille_to_character_dictionary[braille1 + braille2 + braille3 + braille4 + braille5 + braille6]
      require "pry"; binding.pry
    end
  end

end

night_reader = NightReader.new
require "pry"; binding.pry
