require 'gilded_rose'
require 'aged_brie'
require 'backstage_pass'
require 'conjured'
require 'sulfura'
require 'normal'

describe GildedRose do
  it 'decreases the quality by 1 on normal items before expiry date is reached' do
    item = Normal.new('Shrunken head', 10, 50)
    gilded_rose = GildedRose.new
    gilded_rose.add(item)
    gilded_rose.update_quality
    expect(item.quality).to eq 49
  end
  it 'decreases the quality by 1 on normal items before expiry date is reached - lower quality' do
    item = Normal.new('Shrunken head', 10, 32)
    gilded_rose = GildedRose.new
    gilded_rose.add(item)
    gilded_rose.update_quality
    expect(item.quality).to eq 31
  end
  it 'decreases the quality by 1 on normal items before expiry date is reached - multiple items' do
    item = Normal.new('Shrunken head', 10, 32)
    item_2 = Normal.new('Mermaid tail', 5, 21)
    gilded_rose = GildedRose.new
    gilded_rose.add_several([item, item_2])
    gilded_rose.update_quality
    expect(item.quality).to eq 31
    expect(item_2.quality).to eq 20
  end
  it 'decreases the quality by 2 on normal items after expiry date is reached - multiple items' do
    item = Normal.new('Shrunken head', 1, 32)
    item_2 = Normal.new('Mermaid tail', 1, 21)
    gilded_rose = GildedRose.new
    gilded_rose.add_several([item, item_2])
    gilded_rose.update_quality
    gilded_rose.update_quality
    expect(item.quality).to eq 29
    expect(item_2.quality).to eq 18
  end
  it 'decreases the sell_in time by 1 on normal items' do
    item = Normal.new('Shrunken head', 10, 50)
    gilded_rose = GildedRose.new
    gilded_rose.add(item)
    gilded_rose.update_quality
    expect(item.sell_in).to eq 9
  end
  it 'decreases the sell_in time by 1 on normal items - lower count' do
    item = Normal.new('Shrunken head', 4, 50)
    gilded_rose = GildedRose.new
    gilded_rose.add(item)
    gilded_rose.update_quality
    expect(item.sell_in).to eq 3
  end
  it 'decreases the sell_in time by 1 on normal items - multiple items' do
    item = Normal.new('Shrunken head', 10, 32)
    item_2 = Normal.new('Mermaid tail', 5, 21)
    gilded_rose = GildedRose.new
    gilded_rose.add_several([item, item_2])
    gilded_rose.update_quality
    expect(item.sell_in).to eq 9
    expect(item_2.sell_in).to eq 4
  end
  it 'increases the quality by 1 on aged brie items before expiry date is reached' do
    item = AgedBrie.new('Aged Brie', 10, 30)
    gilded_rose = GildedRose.new
    gilded_rose.add(item)
    gilded_rose.update_quality
    expect(item.quality).to eq 31
  end
  it 'increases the quality by 1 on aged brie items before expiry date is reached - different quality' do
    item = AgedBrie.new('Aged Brie', 10, 25)
    gilded_rose = GildedRose.new
    gilded_rose.add(item)
    gilded_rose.update_quality
    expect(item.quality).to eq 26
  end
  it 'increases the quality by 1 on aged brie items before expiry date is reached - multiple items' do
    item = AgedBrie.new('Aged Brie', 10, 25)
    item_2 = Normal.new('Mermaid tail', 5, 21)
    gilded_rose = GildedRose.new
    gilded_rose.add_several([item, item_2])
    gilded_rose.update_quality
    expect(item.quality).to eq 26
    expect(item_2.quality).to eq 20
  end
  it 'increases the quality by 2 on aged brie items after expiry date is reached' do
    item = AgedBrie.new('Aged Brie', 1, 30)
    gilded_rose = GildedRose.new
    gilded_rose.add(item)
    gilded_rose.update_quality
    gilded_rose.update_quality
    expect(item.quality).to eq 32
  end
  it 'decreases the sell_in time by 1 on Aged Brie items' do
    item = AgedBrie.new('Aged Brie', 10, 30)
    gilded_rose = GildedRose.new
    gilded_rose.add(item)
    gilded_rose.update_quality
    expect(item.sell_in).to eq 9
  end
  it 'increases the quality by 1 on backstage pass items up until 10 days before the concert' do
    item = BackstagePass.new('Backstage passes to a TAFKAL80ETC concert', 12, 30)
    gilded_rose = GildedRose.new
    gilded_rose.add(item)
    gilded_rose.update_quality
    expect(item.quality).to eq 31
  end
  it 'increases the quality by 2 on backstage pass items between 10 - 6 days before the concert' do
    item = BackstagePass.new('Backstage passes to a TAFKAL80ETC concert', 10, 30)
    gilded_rose = GildedRose.new
    gilded_rose.add(item)
    gilded_rose.update_quality
    expect(item.quality).to eq 32
  end
  it 'increases the quality by 2 on backstage pass items between 5 - 1 days before the concert' do
    item = BackstagePass.new('Backstage passes to a TAFKAL80ETC concert', 5, 30)
    gilded_rose = GildedRose.new
    gilded_rose.add(item)
    gilded_rose.update_quality
    expect(item.quality).to eq 33
  end
  it 'decreases the sell_in time by 1 on backstage pass items' do
    item = BackstagePass.new('Backstage passes to a TAFKAL80ETC concert', 10, 30)
    gilded_rose = GildedRose.new
    gilded_rose.add(item)
    gilded_rose.update_quality
    expect(item.sell_in).to eq 9
  end
  it 'never decreases the value on Sulfura items' do
    item = Sulfura.new('Sulfuras, Hand of Ragnaros', 10, 30)
    gilded_rose = GildedRose.new
    gilded_rose.add(item)
    gilded_rose.update_quality
    expect(item.quality).to eq 30
  end
  it 'sulfuras expiry date never decreases' do
    item = Sulfura.new('Sulfuras, Hand of Ragnaros', 10, 30)
    gilded_rose = GildedRose.new
    gilded_rose.add(item)
    gilded_rose.update_quality
    expect(item.sell_in).to eq 10
  end
  it 'Aged Brie items cannot exceed quality of 50' do
    item = AgedBrie.new('Aged Brie', 10, 50)
    gilded_rose = GildedRose.new
    gilded_rose.add(item)
    gilded_rose.update_quality
    expect(item.sell_in).to eq 9
    expect(item.quality).to eq 50
  end
  it 'backstage pass items cannot exceed quality of 50' do
    item = BackstagePass.new('Backstage passes to a TAFKAL80ETC concert', 10, 50)
    gilded_rose = GildedRose.new
    gilded_rose.add(item)
    gilded_rose.update_quality
    expect(item.sell_in).to eq 9
    expect(item.quality).to eq 50
  end
  it 'conjured items quality increases by 2 before expiry date' do
    item = Conjured.new('Conjured madness', 10, 50)
    gilded_rose = GildedRose.new
    gilded_rose.add(item)
    gilded_rose.update_quality
    expect(item.quality).to eq 48
    expect(item.sell_in).to eq 9
  end
  it "adds items that don't throw an error" do
    item = Conjured.new('Conjured madness', 10, 50)
    item_2 = BackstagePass.new('Backstage passes to a TAFKAL80ETC concert', -1, 30)
    gilded_rose = GildedRose.new
    expect { gilded_rose.add_several([item, item_2]) }
      .to raise_error 'Backstage passes to a TAFKAL80ETC concert has passed its expiry date!'
    expect(gilded_rose.items).to eq([item])
  end
  it 'stops the program if a bad item is added' do
    item = Conjured.new('Conjured madness', 10, 50)
    item_2 = BackstagePass.new('Backstage passes to a TAFKAL80ETC concert', -1, 30)
    gilded_rose = GildedRose.new
    expect { gilded_rose.add_several([item_2, item]) }
      .to raise_error 'Backstage passes to a TAFKAL80ETC concert has passed its expiry date!'
    expect(gilded_rose.items).to eq([])
  end
end
