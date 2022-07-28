require 'item'

describe Item do
  it 'returns the item details as a string' do
    item = Item.new('Shrunken head', 10, 50)
    expect(item.to_s).to eq('Shrunken head, 10, 50')
  end
end
