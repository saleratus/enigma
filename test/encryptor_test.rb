require_relative './test_helper'
require_relative '../lib/encryptor'
require_relative '../lib/message_bundle'

class EncryptorTest < Minitest::Test

  def setup
    @message = 'hello world!! end'
    @key = '02715'
    @date = '040895'
    @bundle = MessageBundle.new(@message, @key, @date)
    @e = Encryptor.new(@bundle)
  end

  def test_it_exists
    assert_instance_of Encryptor, @e
  end

  def test_it_has_message_bundle
    assert_equal @bundle, @e.m
  end

  def test_it_initializes_and_holds_shifter
    assert_instance_of Shifter, @e.shifter
  end

  def test_it_encrypts_message
    expected = "keder ohulw!! xgg"
    Encryptor.run(@bundle)
    assert_equal expected, @bundle.result
  end

  def test_it_encripts_message_with_capitalization
    message = 'hElLo wOrLd!! eNd'
    @bundle = MessageBundle.new(message, @key, @date)
    Encryptor.run(@bundle)
    expected = "keder ohulw!! xgg"
    assert_equal expected, @bundle.result
  end

end
