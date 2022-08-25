# lib/gilded_rose.rb

class GildedRose
  # there is no point in updating the items if you can't access them
  attr_reader :items

  def initialize
    @items = []
  end

  def add(item)
    raise "#{item.name} quality cannot exceed 50!" if item.quality > 50
    raise "#{item.name} has passed its expiry date!" if item.sell_in.negative?

    @items << item
  end

  def add_several(items)
    items.each { |item| add(item) }
  end

  def update_quality
    @items.map do |item|
      item.update
    end
  end
end
