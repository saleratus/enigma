require_relative './test_helper'
require './lib/enigma'

class EnigmaTest < Minitest::Test

  def setup
    @e = Enigma.new
    @my_message = "this is so secret ..end.."
  end

  def test_it_exists
    assert_instance_of Enigma, @e
  end

  def test_it_saves_message
    expected = @my_message
    assert_equal expected, @e.message
  end

  def test_it_encrypts_message_with_key_and_date
    skip
    output = @e.encrypt(@my_message, "12345", Date.today)
    puts output
  end

  def test_it_encrypts_message_without_key_and_date
    skip
    output = @e.encrypt(@my_message)
  end

end
