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

  private

  attr_reader :menu

end
