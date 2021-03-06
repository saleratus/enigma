require_relative './test_helper'
require_relative '../lib/enigma'
require_relative '../lib/message_bundle'

class EnigmaTest < Minitest::Test

  def setup
    @e = Enigma.new
    @message = "hello world! end"
    @key = "02715"
    @date = "040895"
  end

  def test_it_exists
    assert_instance_of Enigma, @e
  end

  def test_it_encrypts_message_with_key_and_date
    actual = @e.encrypt(@message, @key, @date)
    assert_equal "keder ohulw!cefx", actual[:encryption]
    assert_equal @key, actual[:key]
    assert_equal @date, actual[:date]
  end

  def test_it_encrypts_message_without_key_and_date
    actual = @e.encrypt(@message)
    assert !('' == actual[:encryption])
    assert_instance_of Integer, actual[:key].to_i
    assert_instance_of Integer, actual[:date].to_i
  end

  def test_it_decrypts_message_with_key_and_date
    actual = @e.decrypt("keder ohulw", "02715", "040895")
    assert_equal "hello world", actual[:decryption]
    assert_equal @key, actual[:key]
    assert_equal @date, actual[:date]
  end

  def test_it_decrypts_message_with_only_a_key
    today_date_string = Date.new.strftime("%d%m%y")
    actual = @e.decrypt("keder ohulw", "02715")
    assert !('' == actual[:decryption])
    assert_equal @key, actual[:key]
    assert_equal today_date_string, actual[:date]
  end

  def test_it_cracks_message_with_date
    encrypted = @e.encrypt("hello world end", "02715", "040895")
    expected = {:decryption=>"hello world end", :date=>"040895", :key=>"02715"}
    cracked = @e.crack(encrypted[:encryption], "040895")
    assert_equal expected, cracked

  end

end
