require_relative './test_helper'
require './lib/shift'
require './lib/message_bundle'

class ShiftTest < Minitest::Test

  def setup
    @key = "02715"
    @date = "040895"
    @m = MessageBundle.new("hello world end", @key, @date)
    @position = 2 #of 4 possible positions from 0 to 3
    @s = Shift.new(@m, @position)
  end

  def test_it_exists
    assert_instance_of Shift, @s
  end

  def test_it_has_shift_value
    assert_instance_of Integer, @s.shift_value
  end

  def test_it_calculates_position_key
    assert_equal 02, @s.position_key(@key, 0)
    assert_equal 27, @s.position_key(@key, 1)
    assert_equal 71, @s.position_key(@key, 2)
    assert_equal 15, @s.position_key(@key, 3)
  end

  def test_it_calculates_position_offset
    assert_equal 1, @s.position_offset(@date, 0)
    assert_equal 0, @s.position_offset(@date, 1)
    assert_equal 2, @s.position_offset(@date, 2)
    assert_equal 5, @s.position_offset(@date, 3)
  end

  def test_it_calculates_shift
    @s.calculate_shift(@key, @date, @position)
    assert_equal 73, @s.shift_value
  end

end
