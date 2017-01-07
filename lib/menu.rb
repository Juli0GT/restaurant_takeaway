class Menu

  attr_reader :dishes

  def initialize(dishes)
    @dishes = dishes
  end

  def print
    dishes.map do |name, price|
      "%s £%.2f" % [name.to_s.capitalize, price]
    end.join(", ")
  end

  def has_dish?(dish)
    dishes.include?(dish)
  end

  def dish_price(dish)
    dishes[dish]
  end
end
