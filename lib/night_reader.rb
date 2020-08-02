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
          braille1 = braille[num * 2]
          braille2 = braille[num * 2 + 1]
          braille3 = braille[num * 2 + 80]
          braille4 = braille[num * 2 + 81]
          braille5 = braille[num * 2 + 160]
          braille6 = braille[num * 2 + 161]
          english_characters += @reader.braille_to_character_dictionary[braille1 + braille2 + braille3 + braille4 + braille5 + braille6]
          if num == 39
            braille.slice!(0..239)
          end
        end
      end
    end
    english_characters += translate_last_line(braille)
  end


  def translate_last_line(braille)
    last_line_characters = ""
    if braille.size > 0
      size = braille.size / 6
      size.times do |num|
        braille1 = braille[num * 2]
        braille2 = braille[num * 2 + 1]
        braille3 = braille[num * 2 + (size * 2)]
        braille4 = braille[num * 2 + (size * 2 + 1)]
        braille5 = braille[num * 2 + (size * 2 * 2)]
        braille6 = braille[num * 2 + (size * 2 * 2 + 1)]
        last_line_characters += @reader.braille_to_character_dictionary[braille1 + braille2 + braille3 + braille4 + braille5 + braille6]
      end
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

# night_reader = NightReader.new
