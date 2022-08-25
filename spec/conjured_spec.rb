require 'conjured'

describe Conjured do
  it 'returns the item details as a string' do
    item = Conjured.new('magic thing', 10, 50)
    expect(item.to_s).to eq('magic thing, 10, 50')
  end
  it 'conjured items quality increases by 2 before expiry date' do
    item = Conjured.new('Conjured madness', 10, 50)
    item.update
    expect(item.quality).to eq 48
    expect(item.sell_in).to eq 9
  end
end