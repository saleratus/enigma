require_relative './test_helper'
require './lib/shifter'
require './lib/message_bundle'

class ShifterTest < Minitest::Test

  def setup
    @key = "02715"
    @date = "040895"
    @m = MessageBundle.new("hello world end", @key, @date)
    @position = 2 #of 4 possible positions from 0 to 3
    @s = Shifter.new(@m)
  end

  def test_it_exists
    assert_instance_of Shifter, @s
  end

  def test_it_has_shifts_array
    assert_instance_of Array, @s.shifts
  end

  def test_it_calculates_position_key
    assert_equal 02, @s.position_key(0)
    assert_equal 27, @s.position_key(1)
    assert_equal 71, @s.position_key(2)
    assert_equal 15, @s.position_key(3)
  end

  def test_it_calculates_position_offset
    assert_equal 1, @s.position_offset(0)
    assert_equal 0, @s.position_offset(1)
    assert_equal 2, @s.position_offset(2)
    assert_equal 5, @s.position_offset(3)
  end

  def test_it_calculates_shift
    shift = @s.calculate_shift(@position)
    assert_equal 73, shift
  end

  def test_it_saves_all_four_shifts
    expected = [3, 27, 73, 20]
    assert_equal expected, @s.shifts
  end

  def test_it_shifts_a_character
    char = 'm'
    @s.char_shift(char, @position)
  end

end
