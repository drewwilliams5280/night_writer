require "simplecov"
SimpleCov.start
require 'minitest/autorun'
require 'minitest/pride'
require 'mocha/minitest'
require './lib/night_writer'
require './lib/file_reader'

class NightWriterTest < Minitest::Test

  def test_it_exists_with_attributes
    ARGV.replace ["message.txt", "braille.txt"]
    night_writer = NightWriter.new
    assert_instance_of NightWriter, night_writer
    assert_instance_of FileReader, night_writer.reader
  end

  def test_it_can_get_file_character_count
    ARGV.replace ["message.txt", "braille.txt"]
    night_writer = NightWriter.new
    assert_equal 256, night_writer.reader.read.size
  end

  def test_it_can_give_initial_output
    ARGV.replace ["message.txt", "braille.txt"]
    night_writer = NightWriter.new
    assert_equal "Created '#{ARGV[1]}' containing #{night_writer.reader.read.size} characters",
    night_writer.initial_output
  end

  def test_it_can_get_dictionary
    ARGV.replace ["message.txt", "braille.txt"]
    night_writer = NightWriter.new
    test_array = ("a".."z").to_a
    space = " "
    test_array << space
    assert_equal test_array, night_writer.reader.dictionary.keys
  end

  def test_it_can_encode_to_braille_with_single_letter
    ARGV.replace ["message.txt", "braille.txt"]
    night_writer = NightWriter.new
    assert_equal "0.\n..\n..", night_writer.encode_to_braille("a")
  end

  def test_it_can_encode_to_braille_with_any_amount_of_letters
    ARGV.replace ["message.txt", "braille.txt"]
    night_writer = NightWriter.new
    assert_equal "0.0.\n..0.\n....", night_writer.encode_to_braille("ab")
  end

  def test_it_can_encode_with_character_limit
    ARGV.replace ["message.txt", "braille.txt"]
    night_writer = NightWriter.new
    assert_equal ".00..0.0...0.0..0....00..0.0..00.00.0....00.0..0...0..000.0.00...00...0.0....0.00...0.0.00000.0.00..0.0000..00.000.000...0.000..000.0.0.0.00.00.0..0..0.0.0000..\n00000.0...0.0.......00.00.00..0.0.0..0..0000..00..0....0.0.0.0..00.0..0..0..0000.0..00...0.000.0.0.....0.0..0.0.0.00.0..0.0.......00..00....00.0000...0..0.000..\n0.....0.....0.......0...0.0.......0.....0.....0.......0.........0.0.........0..00.....000...0.........0...........0.00..0...00........0.....0...0.0...0.0.0.....\n.00....00.0..0..0000..000.0..00.00.0..000.0..0.0...0000.00..0.0000...00....00.0..0..0000...00..0.0.0..0.0.00...00..0.0...0.0..0....00..0.0..00.00.0....00.0..0..\n0..0..0000..00.....0..0.00.000.0..00.....0.0000...0.0..0.......0.0..0..0..0000..00.....0..00.00.000...00...0..00000.0...0.0.......00.00.00..0.0.0..0..0000..00..\n0.0...0.....0...0.00..0.0.0.......0...0.....0.0...0.0.........0.....0.0...0.....0...0.00..0...0.0.0...0.000...0.....0.....0.......0...0.0.......0.....0.....0...\n.0..000.0.00...00...0.0....0.00...0.0.00000.0.00..0.0000..00.000.000...0.000..000.0.0.0.00.00.0..0..0.0.0000...00....00.0..0..0000..000.0..00.00.0..000.0..0.0..\n0....0.0.0.0..00.0..0..0..0000.0..00...0.000.0.0.....0.0..0.0.0.00.0..0.0.......00..00....00.0000...0..0.000..0..0..0000..00.....0..0.00.000.0..00.....0.0000...\n....0.........0.0.........0..00.....000...0.........0...........0.00..0...00........0.....0...0.0...0.0.0.....0.0...0.....0...0.00..0.0.0.......0...0.....0.0...\n.0000.00..000.00...00.0.0.0.0.\n0.0..0.....0...0..00.0.000.0.0\n0.0.......00..00...00.0...0.0.",
    night_writer.encode_with_character_limit
  end

end
