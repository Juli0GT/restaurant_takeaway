require 'order'
require 'menu'

describe Order do
  subject(:order) { described_class.new(menu) }
  let(:menu) { instance_double("Menu") }

  let(:dishes) do
    {
      chicken: 3,
      soup: 3
    }
  end

  before do
    allow(menu).to receive(:has_dish?).with(:chicken).and_return(true)
    allow(menu).to receive(:has_dish?).with(:soup).and_return(true)

    allow(menu).to receive(:price).with(:chicken).and_return(3.00)
    allow(menu).to receive(:price).with(:fish).and_return(2.50)
  end

  it 'can select different dishes from the menu' do
    order.add(:chicken, 3)
    order.add(:soup, 3)
    expect(order.dishes).to eq(dishes)
  end

  it 'can not select items which are not on the menu' do
    allow(menu).to receive(:has_dish?).with(:seafood).and_return(false)
    expect{order.add(:seafood, 4)}.to raise_error "Seafood is out of the menu."
  end
end
