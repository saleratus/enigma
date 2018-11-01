
class Enigma
  attr_reader :message

  def encrypt(message, key = nil, date = nil)
    @message = message
  end

  def random_key
    rand(100_000)
  end

end
