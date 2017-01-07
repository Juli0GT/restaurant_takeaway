require 'takeaway'

describe Takeaway do
  subject(:takeaway) { described_class.new(menu: menu, order: order, sms: sms, config: {})}
  let(:menu) { double(:menu, print: printed_menu)}
  let(:sms) { instance_double("SMS", send: nil) }
  let(:order) { instance_double("Order", total_price: 18.50) }
  let(:printed_menu) { "Chicken: £4.50" }
  let(:dishes) { {soup:3, chicken: 3}}

  before do
    allow(order).to receive(:add)
  end

  it 'shows the menu with a list of dishes and the prices' do
    expect(takeaway.print_menu).to eq(printed_menu)
  end

  it 'can order some number of several available dishes' do
    expect(order).to receive(:add).twice
    takeaway.make_order(dishes)
  end

  it 'knows the order total' do
    total = takeaway.make_order(dishes)
    expect(total).to eq(18.50)
  end

  it 'sends an SMS when the order has been placed' do
    expect(sms).to receive(:send)
    takeaway.make_order(dishes)
  end
end
