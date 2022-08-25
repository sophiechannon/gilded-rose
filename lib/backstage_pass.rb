require "item"

class BackstagePass < Item
  def update
    unless @quality >= 50
      @quality += if @sell_in <= 5
                    3
                  elsif @sell_in <= 10
                    2
                  else
                    1
                  end
    end
    @sell_in -= 1
  end
end