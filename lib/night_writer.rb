require './lib/file_reader'
require './lib/file_writer'
require 'csv'

class NightWriter
  attr_reader :reader, :writer

  def initialize
    @reader = FileReader.new
    puts initial_output
  end

  def encode_file_to_braille
    # I wouldn't worry about testing this method
    # unless you get everything else done
    plain = @reader.read.chomp
    require "pry"; binding.pry
    braille = encode_to_braille(plain)
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

  def initial_output
    "Created '#{ARGV[1]}' containing #{@reader.read.size} characters"
  end

end

night_writer = NightWriter.new
require "pry"; binding.pry
