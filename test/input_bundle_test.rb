require_relative './test_helper'
require './lib/input_bundle'

class InputBundleTest < Minitest::Test

  def setup
    @my_message = "this is so secret ..end.."
    @i = InputBundle.new(@my_message, 87525, Date.new)
  end

  def test_it_exists
    assert_instance_of InputBundle, @i
  end

  def test_it_saves_message
    expected = @my_message
    assert_equal expected, @i.message
  end

  def test_it_saves_given_key
    assert_equal 87525, @i.key
  end

  def test_it_saves_given_date
    date = Date.new
    @i = InputBundle.new(@my_message, 77777, date)
    assert_instance_of Date, @i.date
  end

  def test_it_creates_random_key
    100_000.times do
      key = @i.random_key
      in_range = key >= 0 && key <= 99_999
      assert in_range
    end
  end

  def test_it_assigns_default_key
    @i = InputBundle.new(@my_message)
    assert_instance_of Integer, @i.key
    in_range = @i.key >= 0 && @i.key <= 99_999
    assert in_range
  end

  def test_it_assigns_default_date
    @i = InputBundle.new(@my_message, 44444)
    assert_instance_of Date, @i.date
    @i = InputBundle.new(@my_message)
    assert_instance_of Date, @i.date
  end

end
