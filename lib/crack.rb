

#STEP 1. Use last 4 letters to find shifts

#STEP 2. Use given date, or today, to subtract offsets from shifts,
#       yielding key minimums

#STEP 3. increase key minimums as necessary by 27s to find matching set

require './lib/shifter'

class Crack

  attr_reader :m, :shifter, :direction

  def initialize(message_bundle)
    @m = message_bundle
    @shifter = Shifter.new(@m)
    @direction = -1
  end

  def self.run(message_bundle)
    self.new(message_bundle)
  end

end
