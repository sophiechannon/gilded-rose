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
      next if sulfura?(item)

      apply_quality_rules(item)
      item.sell_in -= 1
    end
  end

  private

  def handle_normal(item)
    item.quality -= item.sell_in.positive? ? 1 : 2
  end

  def handle_aged_brie(item)
    return if item.quality == 50

    item.quality += item.sell_in.negative? ? 2 : 1
  end

  def handle_backstage_pass(item)
    return if item.quality == 50

    item.quality += if item.sell_in <= 5
                      3
                    elsif item.sell_in <= 10
                      2
                    else
                      1
                    end
  end

  def handle_conjured(item)
    item.quality -= item.sell_in.positive? ? 2 : 4
  end

  def sulfura?(item)
    item.name.downcase.include?('sulfura')
  end

  def apply_quality_rules(item)
    item_name = item.name.downcase
    if item.is_a? AgedBrie
      handle_aged_brie(item)
    elsif item.is_a? BackstagePass
      handle_backstage_pass(item)
    elsif item_name.include?('conjured')
      handle_conjured(item)
    else
      handle_normal(item)
    end
  end
end
