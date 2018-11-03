require_relative './test_helper'
require './lib/message_bundle'

class MessageBundleTest < Minitest::Test

  def setup
    @my_message = "hello world end"
    @m = MessageBundle.new(@my_message, "02715", "040895")
  end

  def test_it_exists
    assert_instance_of MessageBundle, @m
  end

  def test_it_saves_message
    expected = @my_message
    assert_equal expected, @m.message
  end

  def test_it_saves_given_key
    assert_equal "02715", @m.key
  end

  def test_it_saves_given_date
    date = "040895"
    @m = MessageBundle.new(@my_message, "77777", date)
    assert_equal date, @m.date
  end

  def test_it_creates_random_key
    142_387.times do
      key = @m.random_key
      assert_equal 5, key.length
      key = key.to_i
      in_range = key >= 0 && key <= 99_999
      assert in_range
    end
  end

  def test_it_assigns_default_random_key
    @m = MessageBundle.new(@my_message)
    assert_instance_of String, @m.key
    assert_equal 5, @m.key.length
    assert_instance_of Integer, @m.key.to_i
  end

  def test_it_creates_todays_date_string
    today = @m.todays_date_string
    assert_instance_of String, today
    assert_equal 6, today.length
    assert_instance_of Integer, today.to_i
  end

  def test_it_assigns_default_date
    @m = MessageBundle.new(@my_message, 44444)
    assert_instance_of String, @m.date
    assert_equal 6, @m.date.length
  end

end
