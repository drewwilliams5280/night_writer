require './lib/file_reader'
require 'csv'

class NightReader

  attr_reader :reader
  def initialize
    @reader = FileReader.new
    decode_file_to_text
    puts initial_output
  end

  def initial_output
    "Created '#{ARGV[1]}' containing #{translate_braille_file.size} characters"
  end

  def translate_braille_file
    english_characters = ""
    braille = @reader.read.delete("\n")
    if braille.size > 240
      (braille.size / 240).times do
        40.times do |num|
          english_characters += translate_braille_character(braille, num)
          if num == 39
            braille.slice!(0..239)
          end
        end
      end
    end
    english_characters += translate_last_line(braille, braille.size / 6)
  end

  def translate_braille_character(braille, character)
    text = ""
    pair1 = braille[character * 2] + braille[character * 2 + 1]
    pair2 = braille[character * 2 + 80] + braille[character * 2 + 81]
    pair3 = braille[character * 2 + 160] + braille[character * 2 + 161]
    text += @reader.braille_to_character_dictionary[pair1 + pair2 + pair3]
  end

  def translate_last_line(braille, size)
    last_line_characters = ""
    size.times do |num|
      pair1 = braille[num * 2] + braille[num * 2 + 1]
      pair2 = braille[num * 2 + (size * 2)] + braille[num * 2 + (size * 2 + 1)]
      pair3 = braille[num * 2 + (size * 2 * 2)] + braille[num * 2 + (size * 2 * 2 + 1)]
      last_line_characters += @reader.braille_to_character_dictionary[pair1 + pair2 + pair3]
    end
    last_line_characters
  end

  def decode_file_to_text
    text = translate_braille_file
    filename = ARGV[1]
    File.open(filename, "w") do |file|
      file.write text
    end
  end

end

NightReader.new
