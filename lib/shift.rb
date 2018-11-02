class Shift
  attr_reader :shift_value

  def initialize(message_bundle, position)
    @shift_value = 73
  end

  def calculate_shift(key, date, position)


  end

  def position_key(key, position)
    key[position..(position + 1)].to_i
  end

  def position_offset(date, position)
    1
  end

end
