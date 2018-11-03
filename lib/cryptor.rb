require_relative '../lib/shifter'

class Cryptor
  attr_reader :m, :shifter

  def initialize(message_bundle)
    @m = message_bundle
    @shifter = Shifter.new(@m)
  end

  def self.run(message_bundle)
    self.new(message_bundle)
  end

  def crypt
    @m.result = ''
    @m.message.downcase.each_char.with_index do |char, i|
      position = (i % 4)
      @m.result << @shifter.char_shift(char, position, @direction)
    end
  end

end
