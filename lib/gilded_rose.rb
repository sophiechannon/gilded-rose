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
      next if item.name.include?("Sulfura")
      if item.name.include?("Aged Brie")
        handleAgedBrie(item)
      elsif item.name.include?("Backstage pass")
        handleBackstagePasses(item)
      else
        item.quality -= 1
      end
      item.sell_in -= 1
    end
  end

  private

  def handleAgedBrie(item)
    unless item.quality >= 50
      item.sell_in < 0 ? item.quality += 2 : item.quality += 1
    end
  end

  def handleBackstagePasses(item)
    unless item.quality >= 50
      if item.sell_in <= 5
        item.quality += 3
      elsif item.sell_in <= 10 
        item.quality += 2
      else
        item.quality += 1
      end
    end
  end
end