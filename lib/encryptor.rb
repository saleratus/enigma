require_relative '../lib/cryptor'

class Encryptor < Cryptor

  def initialize(message_bundle)
    @direction = +1
    super(message_bundle)
    crypt
  end

end
