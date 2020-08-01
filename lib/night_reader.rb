require './lib/file_reader'
require 'csv'

class NightReader

  attr_reader :reader
  def initialize
    @reader = FileReader.new
  end


end
