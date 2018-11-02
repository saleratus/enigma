require_relative './test_helper'
require './lib/shift'
require './lib/message_bundle'

class ShiftTest < Minitest::Test

  def setup
    @key = "02715"
    @date = "04895"
    @i = MessageBundle.new("hello goodbye end", @key, @date)
    position = 2 #of possible 4 positions from 0 to 3
    @s = Shift.new(@i, position)
  end

  def test_it_exists
    assert_instance_of Shift, @s
  end

end
