require_relative './test_helper'
require_relative '../lib/crack'
require_relative '../lib/message_bundle'
require_relative '../lib/enigma'

class CrackTest < Minitest::Test

  def setup
    @enigma = Enigma.new
    @encrypted = @enigma.encrypt("hello world end", "02715", "040895")
    @m = MessageBundle.new(@encrypted[:encryption], '00000', "040895")
    @c = Crack.run(@m)
  end

  def test_it_exists
    assert_instance_of Crack, @c
  end

  def test_it_holds_instance_variables
    assert_instance_of MessageBundle, @c.m
    assert_instance_of Shifter, @c.shifter
  end

  def test_shifter_is_properly_initialized
    assert_equal '00000', @c.shifter.key
  end

  def test_it_creates_crack_bundle
    crack_bundle = @c.create_crack_bundle
    assert_instance_of MessageBundle, crack_bundle
    assert_equal "hnwt", crack_bundle.message
    assert_equal "end ", crack_bundle.result
  end

  def test_it_removes_crack_bundle_offsets
    @c.remove_offsets
    assert_equal "fnsj", @c.crack_bundle.message
    assert_equal "end ", @c.crack_bundle.result
  end

  def test_it_finds_character_rotation_distance
    d = @c.rotation_distance("a", "b")
    assert_equal 26, d
    d = @c.rotation_distance("b", "a")
    assert_equal 1, d
    d = @c.rotation_distance(" ", "a")
    assert_equal 26, d
    d = @c.rotation_distance("a", " ")
    assert_equal 1, d
  end

  def test_it_finds_minimum_location_keys
    assert_equal [2, 0, 17, 15], @c.shifter.shifts
  end

  def test_it_finds_left_and_right_chars
    assert_equal '0', @c.left_char(0)
    assert_equal '0', @c.left_char(2)
    assert_equal '3', @c.left_char(36)
    assert_equal '9', @c.left_char(99)
    assert_equal '2', @c.right_char(2)
    assert_equal '0', @c.right_char(30)
    assert_equal '0', @c.right_char(0)
    assert_equal '9', @c.right_char(89)
  end

  def test_it_finds_matching_key_set
    skip
  end

end
