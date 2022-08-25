require 'sulfura'

describe Sulfura do
  it 'returns the item details as a string' do
    item = Sulfura.new('sulfuric acid', 10, 50)
    expect(item.to_s).to eq('sulfuric acid, 10, 50')
  end
  it 'does not update quality and sell in' do
    item = Sulfura.new('sulfuric thing', 10, 30)
    item.update
    expect(item.quality).to eq 30
    expect(item.sell_in).to eq 10
  end
end