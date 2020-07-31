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
    assert_equal ("a".."z").to_a, night_writer.reader.dictionary.keys
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


end
