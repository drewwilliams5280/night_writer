require "simplecov"
SimpleCov.start
require 'minitest/autorun'
require 'minitest/pride'
require 'mocha/minitest'
require './lib/night_reader'
require './lib/file_reader'

class NightReaderTest < Minitest::Test

  def test_it_exists
    night_reader = NightReader.new
    assert_instance_of NightReader, night_reader

  end



end
