require_relative './test_helper'
require_relative '../lib/crack'
require_relative '../lib/message_bundle'
require_relative '../lib/enigma'

class CrackTest < Minitest::Test

  def setup
    @enigma = Enigma.new
    @encrypted = @enigma.encrypt("hello world", "02715", "040895")
    @m = MessageBundle.new(message, nil, date)
    @c = Crack.run(@m)
  end

  def test_it_exists
    assert_instance_of Crack, @c
  end
