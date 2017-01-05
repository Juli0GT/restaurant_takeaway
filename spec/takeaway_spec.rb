require 'takeaway'

describe Takeaway do
  subject(:takeaway) { described_class.new}

  it 'shows the menu with a list of dishes and the prices' do
    expect(takeaway.print_menu).to eq(printed_menu)
  end
end
