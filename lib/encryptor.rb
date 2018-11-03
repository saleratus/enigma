require_relative '../lib/shifter'

class Encryptor

  attr_reader :m, :shifter

  def initialize(message_bundle)
    @m = message_bundle
    @shifter = Shifter.new(@m)
  end

end
