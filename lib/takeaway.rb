class Takeaway

  def initialize(menu:, order:)
    @menu = menu
    @order = order || Order.new
  end

  def print_menu
    menu.print
  end

  def make_order(dishes)
    dishes.each do |dish, quant|
      order.add(dish, quant)
    end
  end

  private

  attr_reader :menu, :order

end
