require_relative './test_helper'
require './lib/shift'

class ShiftTest < Minitest::Test

  def test_it_exists
    actual = Shift.new
    assert_instance_of Shift, actual
  end

end
