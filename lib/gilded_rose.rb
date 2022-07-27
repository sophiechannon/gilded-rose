class GildedRose

  def initialize
    @items = []
  end

  def add(item) 
    fail "Item quality cannot exceed 50!" if item.quality > 50
    @items << item
  end

  def addSeveral(items)
    items.each { |item| add(item) }
  end

  # there is no point in updating the items if you can't access them
  def items
    return @items
  end

  def update_quality
    @items.map do |item| 
      next if item.name.include?("Sulfura")
      applyQualityRules(item)
      item.sell_in -= 1
    end
  end

  private

  def handleNormal(item)
    item.sell_in > 0 ? item.quality -= 1 : item.quality -= 2
  end

  def handleAgedBrie(item)
    unless item.quality == 50
      item.sell_in < 0 ? item.quality += 2 : item.quality += 1
    end
  end

  def handleBackstagePasses(item)
    unless item.quality == 50
      if item.sell_in <= 5
        item.quality += 3
      elsif item.sell_in <= 10 
        item.quality += 2
      else
        item.quality += 1
      end
    end
  end

  def handleConjured(item)
    item.sell_in > 0 ? item.quality -= 2 : item.quality -= 4
  end

  def applyQualityRules(item)
    if item.name.include?("Aged Brie")
      handleAgedBrie(item)
    elsif item.name.include?("Backstage pass")
      handleBackstagePasses(item)
    elsif item.name.include?("Conjured")
      handleConjured(item)
    else
      handleNormal(item)
    end
  end
end