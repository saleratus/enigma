require_relative './test_helper'
require_relative '../lib/crack'
require_relative '../lib/message_bundle'
require_relative '../lib/enigma'

class CrackTest < Minitest::Test

  def setup
    enigma = Enigma.new
    encrypted = enigma.encrypt("hello world", "02715", "040895")
    enigma.crack(encrypted, "040895")
  end
