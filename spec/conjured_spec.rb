require 'conjured'

describe Conjured do
  it 'returns the item details as a string' do
    item = Conjured.new('magic thing', 10, 50)
    expect(item.to_s).to eq('magic thing, 10, 50')
  end
end