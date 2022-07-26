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

  def update_quality()
    @items.each do |item|
      if item.name != "Aged Brie" and item.name != "Backstage passes to a TAFKAL80ETC concert"
        # normal items - degrading by 1 until SellIn date
        if item.quality > 0
          if item.name != "Sulfuras, Hand of Ragnaros"
            item.quality = item.quality - 1
          end
        end
      else
        # brie and passes increase in quality up to 50
        if item.quality < 50
          item.quality = item.quality + 1
          if item.name == "Backstage passes to a TAFKAL80ETC concert"
            # passes fewer than 10 days increase value by 2
            if item.sell_in < 11
              if item.quality < 50
                item.quality = item.quality + 1
              end
            end
            # passes fewer than 5 days increase value by 3
            if item.sell_in < 6
              if item.quality < 50
                item.quality = item.quality + 1
              end
            end
          end
        end
      end
      # except for hand of ragnaros, decrease SellIn every day
      if item.name != "Sulfuras, Hand of Ragnaros"
        item.sell_in = item.sell_in - 1
      end
      # reduce normal item quality by an additional 1 after sell by date
      if item.sell_in < 0
        if item.name != "Aged Brie"
          if item.name != "Backstage passes to a TAFKAL80ETC concert"
            if item.quality > 0
              if item.name != "Sulfuras, Hand of Ragnaros"
                item.quality = item.quality - 1
              end
            end
          else
            # passes lose all value after sellby date
            item.quality = item.quality - item.quality
          end
        else
          # brie continues to get better by
          if item.quality < 50
            item.quality = item.quality + 1
          end
        end
      end
    end
  end
end