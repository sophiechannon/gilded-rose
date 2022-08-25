require 'item'

class Normal < Item
  def update
    @quality -= @sell_in.positive? ? 1 : 2
    @sell_in -= 1
  end
end