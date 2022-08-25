require 'sulfura'

describe Sulfura do
  it 'returns the item details as a string' do
    item = Sulfura.new('sulfuric acid', 10, 50)
    expect(item.to_s).to eq('sulfuric acid, 10, 50')
  end
end