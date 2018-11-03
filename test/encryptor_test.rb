require_relative './test_helper'
require_relative '../lib/encryptor'
require_relative '../lib/message_bundle'

class EncryptorTest < Minitest::Test

  def setup
    @message = "hello world end"
    @key = "02715"
    @date = "040895"
    @bundle = MessageBundle.new(@message, @key, @date)
  end

  def test_it_exists
    e = Encryptor.new(@bundle)
    assert_instance_of Encryptor, e
  end

  def test_it_has_message_bundle
    e = Encryptor.new(@bundle)
    assert_equal @bundle, e.m
  end

  def test_it_initializes_and_holds_shifter
    e = Encryptor.new(@bundle)
    assert_instance_of Shifter, e.shifter
  end

  def test_it_self_initializes
    e = Encryptor.encrypt(@bundle)
    assert_instance_of Encryptor, e
    assert_equal @bundle, e.m
  end

end
