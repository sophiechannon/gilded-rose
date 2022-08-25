require 'item.rb'

class Conjured < Item
  def update
    @quality -= @sell_in.positive? ? 2 : 4
    @sell_in -= 1
  end
end