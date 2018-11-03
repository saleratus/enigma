require_relative './message_bundle'

class Enigma

  attr_reader :m

  def encrypt(message, key = nil, date = nil)
    @m = MessageBundle.new(message, key, date)
  end

end
