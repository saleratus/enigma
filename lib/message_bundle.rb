require 'date'

class MessageBundle
  attr_reader :message, :key, :date

  def initialize(message, key = nil, date = nil)
    @message = message
    @key = key ? key : random_key
    @date = date ? date : todays_date_string
  end

  def random_key
    format('%05d', rand(100_000))
  end

  def todays_date_string
    Date.new.strftime("%d%m%y")
  end

end
