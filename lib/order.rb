class Order

  attr_reader :dishes

  def initialize(menu)
    @dishes = {}
    @menu = menu
  end

  def add(dish, quant)
    raise "#{dish.capitalize} is out of the menu." unless menu.has_dish?(dish)
    dishes[dish] = quant
  end

  def total_price
    item_prices.inject(:+)
  end

  private

  attr_reader :menu

  def item_prices
     dishes.map do |dish, quant|
       menu.dish_price(dish) * quant
     end
   end
 end
