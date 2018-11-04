require_relative './test_helper'
require_relative '../lib/crack'
require_relative '../lib/message_bundle'
require_relative '../lib/enigma'

class CrackTest < Minitest::Test

  def setup
    @enigma = Enigma.new
    @encrypted = @enigma.encrypt("hello world end", "02715", "040895")
    @m = MessageBundle.new(message, '00000', "040895")
    @c = Crack.run(@m)
  end

  def test_it_exists
    assert_instance_of Crack, @c
  end

  def test_it_holds_instance_variables
    assert_instance_of MessageBundle, @c.m
    assert_instance_of Shifter, @c.shifter
    assert_equal (-1), @c.direction
  end

  def test_shifter_is_properly_initialized
    expected_shifts = [1, 0, 2, 5]
    assert_equal expected_shifts, @c.shifter.shifts
    assert_equal '00000', @c.shifter.key
  end

  def test_it_creates_crack_bundle
    crack_bundle = @c.create.crack_bundle
    assert_instance_of Message_Bundle, crack_bundle
  end

  def test_it_finds_minimum_location_keys

    skip
  end

  def test_it_finds_compatible_location_key_multiples
    skip
  end

end
