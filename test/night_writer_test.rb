require 'minitest/autorun'
require 'minitest/pride'
require 'mocha/minitest'
require './lib/night_writer'
require './lib/file_reader'

class NightWriterTest < Minitest::Test

  def test_it_exists_with_attributes
    night_writer = NightWriter.new
    assert_instance_of NightWriter, night_writer
    assert_instance_of FileReader, night_writer.reader
  end

  def test_it_can_get_file_character_count
    night_writer = NightWriter.new
    ARGV.replace ["message.txt"]
    assert_equal 256, night_writer.reader.read.size
  end

  def test_it_can_give_initial_output
    night_writer = NightWriter.new
    ARGV.replace ["message.txt", "braille.txt"]
    assert_equal "Created #{ARGV[1]} containing #{night_writer.reader.read.size} characters",
    night_writer.initial_output
  end


end
