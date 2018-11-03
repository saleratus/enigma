require_relative './test_helper'
require_relative '../lib/encryptor'

class EncryptorTest < Minitest::Test

  def test_it_exists
    assert_instance_of Encryptor, Encryptor.new
  end

end
