
require './lib/shifter'
require './lib/matcher'
require './lib/decryptor'

class Crack
  attr_reader :m, :shifter, :bundle

  include Matcher

  def initialize(message_bundle, init_test = false)
    @m = message_bundle
    @shifter = Shifter.new(@m)
    @bundle = create_bundle_with_4_known_characters
    crackit unless init_test
  end

  def self.run(message_bundle)
    self.new(message_bundle)
  end

  def crackit
    remove_offsets
    find_minimum_location_keys
    minimum_keys = @shifter.shifts
    keys = match(minimum_keys)
    keys_to_message_key(keys)
    Decryptor.run(@m)
  end

  def keys_to_message_key(keys)
    s = ''
    keys.each { |n| s << left_char(n) }
    s << right_char(keys[3])
    @m.key = s
  end

  def create_bundle_with_4_known_characters
    index = @m.origin.length - 4
    rotation = (index % 4) * -1
    origin = @m.origin[index..-1].chars.rotate(rotation).join
    result = ' end'.chars.rotate(rotation).join
    MessageBundle.new(origin, '00000', @m.date, result)
  end

  def remove_offsets
    saved_result = @bundle.result
    Decryptor.run(@bundle)
    @bundle.origin = @bundle.result
    @bundle.result = saved_result
  end

  def rotation_distance(origin_char, result_char)
    set = @shifter.char_set
    rd = set.find_index(origin_char) - set.find_index(result_char)
    rd = rd >= 0 ? rd : rd += 27
  end

  def find_minimum_location_keys
    (0..3).each do |position|
      origin_char = @bundle.origin[position]
      result_char = @bundle.result[position]
      @shifter.shifts[position] = rotation_distance(origin_char, result_char)
    end
  end

end
