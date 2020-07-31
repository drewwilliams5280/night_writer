require './lib/file_reader'
require './lib/file_writer'
require 'csv'

class NightWriter
  attr_reader :reader, :writer

  def initialize
    @reader = FileReader.new
    @writer = FileWriter.new
    @writer.write(@reader.read)
    puts initial_output
  end

  # def encode_file_to_braille
  #   # I wouldn't worry about testing this method
  #   # unless you get everything else done
  #   plain = reader.read
  #   braille = encode_to_braille(plain)
  # end
  #
  # def encode_to_braille(input)
  #   # you've taken in an INPUT string
  #   # do the magic
  #   # send out an OUTPUT string
  # end

  def initial_output
    "Created '#{ARGV[1]}' containing #{@reader.read.size} characters"
  end

end

# night_writer = NightWriter.new
# require "pry"; binding.pry
