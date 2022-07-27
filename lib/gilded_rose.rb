class GildedRose

  def initialize
    @items = []
  end

  def add(item)
    @items << item
    @items = @items.flatten
  end

  def items
    return @items
  end

  def update_quality
    @items.map do |item| 
      if item.name.include?("Aged Brie")
        handleAgedBrie(item)
      else
        item.quality -= 1
        item.sell_in -= 1
      end
    end
  end

  def handleAgedBrie(item)
    item.quality = 31
  end
end