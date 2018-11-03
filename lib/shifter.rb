
class Shifter

  attr_reader :shifts

  def initialize(message_bundle)
    @key = message_bundle.key
    @date = message_bundle.date
    @shifts = []
    4.times do |position|
      @shifts[position] = calculate_shift(position)
    end
  end

  def calculate_shift(position)
    position_key(position) + position_offset(position)
  end

  def position_key(position)
    @key[position..(position + 1)].to_i
  end

  def position_offset(position)
    date_squared_string = ((@date.to_i)**2).to_s
    date_squared_string[(position - 4)].to_i
  end

  def char_shift(char, position)
  end

end
