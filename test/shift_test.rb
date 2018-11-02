require_relative './test_helper'
require './lib/shift'
require './lib/message_bundle'

class ShiftTest < Minitest::Test

  def setup
    @key = "02715"
    @date = "04895"
    @m = MessageBundle.new("hello world end", @key, @date)
    position = 2 #of possible 4 positions from 0 to 3
    @s = Shift.new(@m, position)
  end

  def test_it_exists
    assert_instance_of Shift, @s
  end

  def test_it_calculates_shift
    assert_equal 73, @s.shift_value
  end

end
