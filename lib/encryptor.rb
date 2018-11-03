require_relative '../lib/cryptor'
require_relative '../lib/shifter'

class Encryptor < Cryptor

  def initialize(message_bundle)
    @direction = +1
    super(message_bundle)
    crypt
  end

end
