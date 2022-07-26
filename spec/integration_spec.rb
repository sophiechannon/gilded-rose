require "gilded_rose"
require "item"

describe GildedRose do
  it "decreases the quality by 1 on normal items before expiry date is reached" do
    item = Item.new("Shrunken head", 10, 50)
    gilded_rose = GildedRose.new
    gilded_rose.add(item)
    gilded_rose.update_quality
    expect(item.quality).to eq 49
  end
  it "decreases the sell_in time by 1 on normal items" do
    item = Item.new("Shrunken head", 10, 50)
    gilded_rose = GildedRose.new
    gilded_rose.add(item)
    gilded_rose.update_quality
    expect(item.sell_in).to eq 9
  end
  it "increases the quality by 1 on aged brie items before expiry date is reached" do
    item = Item.new("Aged Brie", 10, 30)
    gilded_rose = GildedRose.new
    gilded_rose.add(item)
    gilded_rose.update_quality
    expect(item.quality).to eq 31
  end
  it "increases the quality by 1 on aged brie items after expiry date is reached" do
    item = Item.new("Aged Brie", -1, 30)
    gilded_rose = GildedRose.new
    gilded_rose.add(item)
    gilded_rose.update_quality
    expect(item.quality).to eq 32
  end
end