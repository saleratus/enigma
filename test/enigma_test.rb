require_relative './test_helper'
require_relative '../lib/enigma'
require_relative '../lib/message_bundle'

class EnigmaTest < Minitest::Test

  def setup
    @e = Enigma.new
    @message = "hello world end"
    @key = "02715"
    @date = "040895"
    @e.encrypt(@message, @key, @date)
  end

  def test_it_exists
    assert_instance_of Enigma, @e
  end

  def test_it_creates_message_bundle
    assert_instance_of MessageBundle, @e.m
  end

  def test_it_encrypts_message_with_key_and_date
    skip
    @e.encrypt(@message, "12345", Date.today)
  end

  def test_it_encrypts_message_without_key_and_date
    skip
    @e.encrypt(@message)
  end

end
