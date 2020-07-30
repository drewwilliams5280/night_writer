require 'minitest/autorun'
require 'minitest/pride'
require 'mocha/minitest'
require './lib/night_writer'



class NightWriterTest < Minitest::Test

  def test_it_exists
    night_writer = NightWriter.new
    assert_instance_of NightWriter, night_writer
  end


end
