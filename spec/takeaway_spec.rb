require 'takeaway'

describe Takeaway do
  subject(:takeaway) { described_class.new(menu: menu, order: order)}
  let(:menu) { double(:menu, print: printed_menu)}
  let(:order) { double(:order) }
  let(:printed_menu) { "Chicken: £4.50" }
  let(:dishes) { {soup:3, chicken: 3}}

  it 'shows the menu with a list of dishes and the prices' do
    expect(takeaway.print_menu).to eq(printed_menu)
  end

  it 'can order some number of several available dishes' do
    expect(order).to receive(:add).twice
    takeaway.make_order(dishes)
  end
end
