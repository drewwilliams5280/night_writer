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
  
end
