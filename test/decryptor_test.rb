require_relative './test_helper'
require_relative '../lib/decryptor'
require_relative '../lib/message_bundle'

class DecryptorTest < Minitest::Test

  def setup
    @bundle = MessageBundle.new("keder ohulw", "02715", "040895")
    @d = Decryptor.run(@bundle)
  end

  def test_it_exists
    assert_instance_of Decryptor, @d
  end

  def test_it_has_message_bundle
    assert_equal @bundle, @d.m
  end

  def test_it_initializes_and_holds_shifter
    assert_instance_of Shifter, @d.shifter
  end

  def test_it_decrypts_message
    expected = "hello world"
    Encryptor.run(@bundle)
    assert_equal expected, @bundle.result
  end

end
