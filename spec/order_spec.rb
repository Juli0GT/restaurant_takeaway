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

    allow(menu).to receive(:dish_price).with(:chicken).and_return(4.50)
    allow(menu).to receive(:dish_price).with(:soup).and_return(5.00)
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

  it 'calculates the total for the order' do
    create_order
    total = 28.50
    expect(order.total_price).to eq(total)
  end

  def create_order
    order.add(:chicken, 3)
    order.add(:soup, 3)
  end
end
