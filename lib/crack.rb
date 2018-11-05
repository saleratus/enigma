
require './lib/shifter'
require './lib/matcher'

class Crack

  attr_reader :m, :shifter, :crack_bundle

  include Matcher

  def initialize(message_bundle)
    @m = message_bundle
    @shifter = Shifter.new(@m)
    @crack_bundle = create_crack_bundle
  end

  def crack
    remove_offsets
    find_minimum_location_keys
    matching_keys = match(@@shifter.shifts)
  end

  def create_crack_bundle
    index = @m.message.length - 4
    rotation = (index % 4) * -1
    origin = @m.message[index..-1].chars.rotate(rotation).join
    result = ' end'.chars.rotate(rotation).join
    MessageBundle.new(origin, '00000', @m.date, result)
  end

  def remove_offsets
    saved_result = @crack_bundle.result
    Decryptor.run(@crack_bundle)
    @crack_bundle.message = @crack_bundle.result
    @crack_bundle.result = saved_result
  end

  def rotation_distance(origin_char, result_char)
    set = @shifter.char_set
    rd = set.find_index(origin_char) - set.find_index(result_char)
    rd = rd >= 0 ? rd : rd += 27
  end

  def find_minimum_location_keys
    (0..3).each do |position|
      origin_char = @crack_bundle.message[position]
      result_char = @crack_bundle.result[position]
      @shifter.shifts[position] = rotation_distance(origin_char, result_char)
    end
  end

end
