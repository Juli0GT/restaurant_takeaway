require 'menu'

describe Menu do
  subject(:menu) { described_class.new(dishes)}
  let(:dishes) do
    {
      chicken_curry: 4.50,
      pho_soup: 5.00,
      summer_rolls: 3.50,
    }
  end

  it 'has a list of dishes with prices' do
    expect(menu.dishes).to eq(dishes)
  end
end
