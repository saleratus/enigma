require_relative './test_helper'
require_relative '../lib/crack'
require_relative '../lib/message_bundle'
require_relative '../lib/enigma'

class CrackTest < Minitest::Test

  def setup
    @enigma = Enigma.new
    @encrypted = @enigma.encrypt("hello world", "02715", "040895")
    @m = MessageBundle.new(message, '00000', "040895")
    @c = Crack.run(@m)
  end

  def test_it_exists
    assert_instance_of Crack, @c
  end

  def test_it_holds_instance_variables
    assert_instance_of MessageBundle, @c.m
    assert_instance_of Shifter, @c.shifter
    assert_equal -1, @c.direction
  end



end
