require "item"

class BackstagePass < Item
  def update
    return if @quality == 50

    @quality += if @sell_in <= 5
                  3
                elsif @sell_in <= 10
                  2
                else
                  1
                end
    
    @sell_in -= 1
  end
end