
require_relative './test_helper'
require_relative '../lib/crack'
require_relative '../lib/message_bundle'
require_relative '../lib/enigma'

class CrackTest < Minitest::Test

  def setup
    @enigma = Enigma.new
    @encrypted = @enigma.encrypt("hello world end", "02715", "040895")
    @m = MessageBundle.new(@encrypted[:encryption], '00000', "040895")
    @c = Crack.new(@m, true)
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

  def test_it_creates_bundle
    bundle = @c.create_bundle_with_4_known_characters
    assert_instance_of MessageBundle, bundle
    assert_equal "hnwt", bundle.origin
    assert_equal "end ", bundle.result
  end

  def test_it_removes_bundle_offsets
    @c.remove_offsets
    assert_equal "gnuo", @c.bundle.origin
    assert_equal "end ", @c.bundle.result
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
    @c.remove_offsets
    @c.find_minimum_location_keys
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

  def matcher_setup
    @keys = [2, 0, 17, 15]
    @data = {keys: @keys, index: 0}
  end

  def test_it_indexes_left_and_right
    matcher_setup
    expected = @c.index_right(@data)[:index]
    assert_equal 1, expected
    expected = @c.index_left(@data)[:index]
    assert_equal 0, expected
  end

  def test_it_increments_next_and_current
    matcher_setup
    e = @c.increment_next(@data)[:keys][1]
    assert_equal 27, e
    e = @c.increment_current(@data)[:keys][0]
    assert_equal 29, e
  end

  def test_it_resets_next_and_current
    matcher_setup
    @data[:keys] = [2, 0, 98, 69]
    @data[:index] = 2
    e = @c.reset_next(@data)[:keys][3]
    assert_equal 15, e
    e = @c.reset_current(@data)[:keys][2]
    assert_equal 17, e
  end

  def test_it_steps_back
    matcher_setup
    @data[:keys] = [11, 17, 78, 94]
    @data[:index] = 2
    data = @c.step_back(@data)
    assert_equal [38, 17, 24, 13], data[:keys]
    assert_equal 0, data[:index]

    @data[:keys] = [11, 90, 78, 94]
    @data[:index] = 2
    data = @c.step_back(@data)
    assert_equal [38, 9, 24, 13], data[:keys]
    assert_equal 0, data[:index]

    @data[:keys] = [88, 90, 78, 94]
    @data[:index] = 2
    data = @c.step_back(@data)
    assert_nil data
  end

  def test_it_creates_next_setup
    data = {keys: [2, 27, 71, 15], index: 1}
    actual = @c.next_setup(data, true)
    expected = {keys: [2, 27, 71, 15], index: 2}
    assert_equal actual, expected

    data = {keys: [92, 26, 15, 11], index: 1}
    actual = @c.next_setup(data, false)
    expected = {keys: [92, 26, 42, 11], index: 1}
    assert_equal actual, expected

    data = {keys: [65, 53, 96, 11], index: 1}
    actual = @c.next_setup(data, false)
    expected = {keys: [92, 26, 15, 11], index: 0}
    assert_equal actual, expected

    data = {keys: [38, 80, 96, 11], index: 1}
    actual = @c.next_setup(data, false)
    expected = {keys: [65, 26, 15, 11], index: 0}
    assert_equal actual, expected
  end

  def test_it_finds_matching_keyset
    actual = @c.match([11, 26, 15, 11])
    assert_equal [92, 26, 69, 92], actual
  end

  def test_it_returns_nil_for_no_match
    actual = @c.match([11, 22, 12, 12])
    assert_nil actual
  end

  def test_it_puts_position_keys_in_bundle_key
    keys = [92, 26, 69, 92]
    @c.keys_to_message_key(keys)
    assert_equal "92692", @m.key
  end

  def test_it_runs_using_class_method
    Crack.run(@m)
    assert_equal "02715", @m.key
  end

  def test_it_places_decryted_message_in_bundle
    Crack.run(@m)
    assert_equal "hello world end", @m.result
  end

end
