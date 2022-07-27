require 'gilded_rose'

describe GildedRose do
  describe "items" do
    it "initially returns empty an array of empty items" do
      fake_item = double :fake_item, quality: 30
      gilded_rose = GildedRose.new
      expect(gilded_rose.items).to eq []
    end
    it "adds and returns an the array" do
      fake_item = double :fake_item, quality: 30
      gilded_rose = GildedRose.new
      gilded_rose.add(fake_item)
      expect(gilded_rose.items).to eq [fake_item]
    end
    it "adds multiple and returns an the array" do
      fake_item = double :fake_item, quality: 30
      fake_item_2 = double :fake_item, quality: 30
      gilded_rose = GildedRose.new
      gilded_rose.add(fake_item)
      gilded_rose.add(fake_item_2)
      expect(gilded_rose.items).to eq [fake_item, fake_item_2]
    end
    it "can add items to the list on bulk" do
      fake_item = double :fake_item, quality: 30
      fake_item_2 = double :fake_item, quality: 30
      gilded_rose = GildedRose.new
      gilded_rose.addSeveral([fake_item, fake_item_2])
      expect(gilded_rose.items).to eq [fake_item, fake_item_2]
    end
    it "throws an error if an item with quality > 50 is added to the shop" do
      fake_item = double :fake_item, quality: 51
      gilded_rose = GildedRose.new
      expect { gilded_rose.add(fake_item) }
        .to raise_error "Item quality cannot exceed 50!"
    end
  end
end