
class Enigma

  def encrypt(message, key = nil, date = nil)
    @i = InputBundle.new(message, key, date)
  end

  def random_key
    rand(100_000)
  end

end
