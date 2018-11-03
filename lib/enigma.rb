require_relative './message_bundle'
require_relative './encryptor'

class Enigma

  attr_reader :m

  def encrypt(message, key = nil, date = nil)
    @m = MessageBundle.new(message, key, date)
    Encryptor.run(@m)
    {encryption: @m.result, key: @m.key, date: @m.date}
  end

  def decrypt(message, key = nil, date = nil)
    @m = MessageBundle.new(message, key, date)
    Decryptor.run(@m)
    {decryption: @m.result, key: @m.key, date: @m.date}
  end

end
