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

  def test_it_can_get_initial_output
    ARGV.replace ["braille.txt", "original_message.txt"]
    night_reader = NightReader.new
    assert_equal "Created 'original_message.txt' containing 256 characters",
    night_reader.initial_output
  end

  def test_it_can_get_definitions
    ARGV.replace ["braille.txt", "original_message.txt"]
    night_reader = NightReader.new
    assert_equal "a", night_reader.reader.braille_to_character_dictionary["0....."]
    assert_equal "b", night_reader.reader.braille_to_character_dictionary["0.0..."]
    assert_equal "x", night_reader.reader.braille_to_character_dictionary["00..00"]
    assert_equal "z", night_reader.reader.braille_to_character_dictionary["0..000"]
  end


end
