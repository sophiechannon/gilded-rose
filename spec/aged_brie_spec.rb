require 'aged_brie'

describe Item do
  it 'returns the item details as a string' do
    item = Item.new('gross cheese', 10, 50)
    expect(item.to_s).to eq('gross cheese, 10, 50')
  end
end