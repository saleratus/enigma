
class Enigma

  def encrypt(message, key = nil, date = nil)
    @i = InputBundle.new(message, key, date)
  end

end
