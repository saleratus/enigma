require 'date'

class InputBundle
  attr_reader :message, :key, :date

  def initialize(message, key = nil, date = nil)
    @message = message
    @key = key ? key : random_key
    @date = date ? date : Date.new
  end

  def random_key
    rand(100_000)
  end

end
