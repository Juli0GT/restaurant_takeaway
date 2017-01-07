require './lib/order'
require './lib/sms'

class Takeaway

  def initialize(menu:, config:, order:nil, sms: nil)
    @menu = menu
    @order = order || Order.new(menu)
    @sms = sms || SMS.new(config)
  end

  def print_menu
    menu.print
  end

  def make_order(dishes)
    order_dishes(dishes)
    sms.send
    order.total_price
  end

  private

  attr_reader :menu, :order, :sms

  def order_dishes(dishes)
    dishes.each do |dish, quant|
      order.add(dish, quant)
    end
  end
end
