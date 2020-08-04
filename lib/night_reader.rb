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
        english_characters += translate_full_line(braille)
        braille.slice!(0..239)
      end
    end
    english_characters += translate_last_line(braille, braille.size / 6)
  end

  def translate_full_line(braille)
    full_line_text = ""
    40.times do |num|
      pair1 = braille[num * 2] + braille[num * 2 + 1]
      pair2 = braille[num * 2 + 80] + braille[num * 2 + 81]
      pair3 = braille[num * 2 + 160] + braille[num * 2 + 161]
      full_line_text += @reader.braille_to_character_dictionary[pair1 + pair2 + pair3]
    end
    full_line_text
  end

  def translate_last_line(braille, size)
    last_line_text = ""
    size.times do |num|
      pair1 = braille[num * 2] + braille[num * 2 + 1]
      pair2 = braille[num * 2 + (size * 2)] + braille[num * 2 + (size * 2 + 1)]
      pair3 = braille[num * 2 + (size * 2 * 2)] + braille[num * 2 + (size * 2 * 2 + 1)]
      last_line_text += @reader.braille_to_character_dictionary[pair1 + pair2 + pair3]
    end
    last_line_text
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
