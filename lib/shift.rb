
class Shift

  attr_reader :shift_value

  def initialize(message_bundle, position)
    @shift_value =
        calculate_shift(message_bundle.key, message_bundle.date, position)
  end

  def calculate_shift(key, date, position)
    position_key(key, position) + position_offset(date, position)
  end

  def position_key(key, position)
    key[position..(position + 1)].to_i
  end

  def position_offset(date, position)
    date_squared_string = ((date.to_i)**2).to_s
    single_digit_offset = date_squared_string[(position - 4)].to_i
  end

end
