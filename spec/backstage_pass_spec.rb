require 'backstage_pass'

describe BackstagePass do
  it 'returns the item details as a string' do
    item = BackstagePass.new('Slipknot', 10, 50)
    expect(item.to_s).to eq('Slipknot, 10, 50')
  end
  it 'increases the quality by 1 on backstage pass items up until 10 days before the concert' do
    item = BackstagePass.new('Backstage passes to a TAFKAL80ETC concert', 12, 30)
    item.update
    expect(item.quality).to eq 31
  end
end