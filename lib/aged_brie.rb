require 'item.rb'

class AgedBrie < Item
  def update
    unless @quality >= 50
      @quality += @sell_in.negative? ? 2 : 1
    end

    @sell_in -= 1
  end
end