def match(data)
  loop do
    keys = data[:keys]
    i = data[:index]
    forward_match = keys[i].right_char == keys[i + 1].left_char
    print "#{i} #{keys} \n"
    return keys if forward_match && i == 2 # SUCCESS

    if forward_match #if match but not done
      data = index_right(data)
    else if keys[i + 1] + 27 <= 99 #if next key can increase
      data = increment_next(data)
    else if keys[i] + 27 <= 99 #if next key maxed & current key can increase
      data = increment_current(data)
      data = reset_next(data)
    else #if dead ended and have to step back
      data = step_back(data)
      return nil if data == nil
    end
  end
end
