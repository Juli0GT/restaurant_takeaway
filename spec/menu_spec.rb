require 'menu'

describe Menu do
  subject(:menu) { described_class.new(dishes)}
  let(:dishes) do
    {
      chicken: 4.50,
      soup: 5.00,
      rolls: 3.50,
    }
  end

  it 'has a list of dishes with prices' do
    expect(menu.dishes).to eq(dishes)
  end

  it 'prints a list of dishes with prices' do
    printed_menu = 'Chicken £4.50, Soup £5.00, Rolls £3.50'
    expect(menu.print).to eq(printed_menu)
  end
end
