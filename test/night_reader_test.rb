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


  def test_it_can_get_dictionary
    ARGV.replace ["message.txt", "braille.txt"]
    night_reader = NightReader.new
    test_array = ("a".."z").to_a
    space = " "
    test_array << space
    assert_equal test_array, night_reader.reader.character_to_braille_dictionary.keys
  end

  def test_it_can_translate_from_braille_file
    ARGV.replace ["braille.txt", "original_message.txt"]
    night_reader = NightReader.new
    assert_equal "this is a test file that i need to be two hundred and fifty six characters long so that my project meets spec and so that my tests run this is a test file that i need to be two hundred and fifty six characters long so that my project meets spec yay woohooo",
    night_reader.translate_braille_file
  end

end
