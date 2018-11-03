require_relative './test_helper'
require_relative '../lib/encryptor'
require_relative '../lib/message_bundle'

class EncryptorTest < Minitest::Test

  def setup
    @message = "hello world end"
    @key = "02715"
    @date = "040895"
    @bundle = MessageBundle.new(@message, @key, @date)
    @e = Encryptor.new(@bundle)
  end

  def test_it_exists
    assert_instance_of Encryptor, @e
  end

  def test_it_has_message_bundle
    assert_equal @bundle, @e.message_bundle
  end

end
