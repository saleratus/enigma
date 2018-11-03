require_relative './message_bundle'
require_relative './encryptor'

class Enigma

  attr_reader :m

  def encrypt(message, key = nil, date = nil)
    @m = MessageBundle.new(message, key, date)
    Encryptor.run(@m)
    @m.result
  end

end
