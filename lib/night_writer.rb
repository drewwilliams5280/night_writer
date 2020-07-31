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
    "#{@reader.dictionary[input][0..1]}\n#{@reader.dictionary[input][2..3]}\n#{@reader.dictionary[input][4..5]}"
  end

  def initial_output
    "Created '#{ARGV[1]}' containing #{@reader.read.size} characters"
  end

end

# night_writer = NightWriter.new
# require "pry"; binding.pry
