
class Shifter

  attr_reader :shifts

  def initialize(message_bundle)
    a_shift = calculate_shift(message_bundle.key, message_bundle.date, 0)
    b_shift = calculate_shift(message_bundle.key, message_bundle.date, 1)
    c_shift = calculate_shift(message_bundle.key, message_bundle.date, 2)
    d_shift = calculate_shift(message_bundle.key, message_bundle.date, 3)
    @shifts = { A: a_shift, B: b_shift, C: c_shift, D: d_shift }
  end

  def calculate_shift(key, date, position)
    position_key(key, position) + position_offset(date, position)
  end

  def position_key(key, position)
    key[ position..(position + 1) ].to_i
  end

  def position_offset(date, position)
    date_squared_string = ((date.to_i)**2).to_s
    date_squared_string[(position - 4)].to_i
  end

end
