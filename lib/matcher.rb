
module Matcher

  def match(keys)
    data = {keys: keys, index: 0}
    loop do
      return nil if data == nil
      keys = data[:keys]
      i = data[:index]
      forward_match = right_char(keys[i]) == left_char(keys[i + 1])
      return keys if (forward_match && i == 2) # SUCCESS
      data = next_setup(data, forward_match)
    end
  end

  def next_setup(data, forward_match)
    keys = data[:keys]
    i = data[:index]
    if forward_match
      data = index_right(data)
    elsif (keys[i + 1] + 27) <= 99 #if no match and next can increment
      data = increment_next(data)
    else #if no match and next is maxed
      data = step_back(data)
    end
    data
  end

  def step_back(data)
    data = reset_next(data)
    until data[:index] == 0
      data = index_left(reset_current(data))
    end
    return nil if data[:keys][0] + 27 > 99
    increment_current(data)
  end

  def index_right(data)
    data[:index] += 1
    data
  end
  def index_left(data)
    data[:index] -= 1
    data
  end
  def increment_next(data)
    data[:keys][data[:index] + 1] += 27
    data
  end
  def increment_current(data)
    data[:keys][data[:index]] += 27
    data
  end
  def reset_next(data)
    data[:keys][data[:index] + 1] %= 27
    data
  end
  def reset_current(data)
    data[:keys][data[:index]] %= 27
    data
  end
  def left_char(n)
    format('%02d', n)[0]
  end
  def right_char(n)
    format('%02d', n)[1]
  end

end
