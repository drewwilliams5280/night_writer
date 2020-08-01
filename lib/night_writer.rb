require './lib/file_reader'
require 'csv'

class NightWriter
  attr_reader :reader, :writer

  def initialize
    @reader = FileReader.new
    encode_file_to_braille
    puts initial_output
  end

  def encode_file_to_braille
    plain = @reader.read.chomp
    braille = encode_with_character_limit
    filename = ARGV[1]
    File.open(filename, "w") do |file|
      file.write braille
    end
  end

  def encode_to_braille(input)
    top_row = ""
    middle_row = ""
    bottom_row = ""
    input.size.times do |num|
      top_row += "#{@reader.dictionary[input[num]][0..1]}"
      middle_row += "#{@reader.dictionary[input[num]][2..3]}"
      bottom_row += "#{@reader.dictionary[input[num]][4..5]}"
    end
    "#{top_row}\n#{middle_row}\n#{bottom_row}"
  end

  def encode_with_character_limit
    split_up = @reader.read.scan(/.{1,80}/)
    braille_split_up = split_up.map do |reader_string|
      encode_to_braille(reader_string)
    end.join("\n")
  end

  def initial_output
    "Created '#{ARGV[1]}' containing #{@reader.read.size} characters"
  end

end

# night_writer = NightWriter.new
