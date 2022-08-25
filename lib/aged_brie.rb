require 'item.rb'

class AgedBrie < Item
  def update
    return if @quality == 50

    @quality += @sell_in.negative? ? 2 : 1
  end
end