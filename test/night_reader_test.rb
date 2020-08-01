require "simplecov"
SimpleCov.start
require 'minitest/autorun'
require 'minitest/pride'
require 'mocha/minitest'
require './lib/night_reader'
require './lib/file_reader'

class NightReaderTest < Minitest::Test

  def test_it_exists_with_attributes
    ARGV.replace ["braille.txt", "original_message.txt"]
    night_reader = NightReader.new
    assert_instance_of NightReader, night_reader
    assert_instance_of FileReader, night_reader.reader
  end

  def test_it_can_get_braille_to_english_character_character_count
    ARGV.replace ["braille.txt", "original_message.txt"]
    night_reader = NightReader.new
    assert_equal 256, (night_reader.reader.read.size / 6) - (night_reader.reader.read.size / 6 / 80)
  end



end
