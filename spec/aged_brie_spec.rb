require 'aged_brie'

describe AgedBrie do
  it 'returns the item details as a string' do
    item = AgedBrie.new('gross cheese', 10, 50)
    expect(item.to_s).to eq('gross cheese, 10, 50')
  end
end