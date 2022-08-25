require 'normal'

describe Normal do
  it 'returns the item details as a string' do
    item = Normal.new('regular thing', 10, 50)
    expect(item.to_s).to eq('regular thing, 10, 50')
  end

  it 'updates the quantity and sell in' do
    item = Normal.new('regular thing', 10, 30)
    item.update
    expect(item.quality).to eq 29
    expect(item.sell_in).to eq 9
  end
end

