require 'backstage_pass'

describe BackstagePass do
  it 'returns the item details as a string' do
    item = BackstagePass.new('Slipknot', 10, 50)
    expect(item.to_s).to eq('Slipknot, 10, 50')
  end
end