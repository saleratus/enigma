require 'date'

class MessageBundle
  attr_accessor :origin, :result, :key
  attr_reader :date

  def initialize(origin, key = nil, date = nil, result = '')
    @origin = origin
    @key = key ? key : random_key
    @date = date ? date : todays_date_string
    @result = result
  end

  def random_key
    format('%05d', rand(100_000))
  end

  def todays_date_string
    Date.today.strftime("%d%m%y")
  end

end
