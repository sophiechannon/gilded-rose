require 'aged_brie'

describe AgedBrie do
  it 'returns the item details as a string' do
    item = AgedBrie.new('gross cheese', 10, 50)
    expect(item.to_s).to eq('gross cheese, 10, 50')
  end

  it 'updates the quantity' do
    item = AgedBrie.new('Aged Brie', 10, 30)
    item.update
    expect(item.quality).to eq 31
    expect(item.sell_in).to eq 9
  end
end