require 'pry'

class Offset
  attr_reader :offset
  def initialize#(offset = calc)
    @offset = offset
  end

  def date
    Date.today.strftime('%d%m%y')
  end
end
