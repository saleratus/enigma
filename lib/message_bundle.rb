require 'date'

class MessageBundle
  attr_reader :message, :key, :date, :cypher

  def initialize(message, key = nil, date = nil, cypher = '')
    @message = message
    @key = key ? key : random_key
    @date = date ? date : todays_date_string
    @cypher = cypher 
  end

  def random_key
    format('%05d', rand(100_000))
  end

  def todays_date_string
    Date.new.strftime("%d%m%y")
  end

end
