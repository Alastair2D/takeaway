require_relative 'menu'
require_relative 'dish'
require_relative 'sms'

class Order
attr_reader :basket, :menu, :on_menu, :empty_basket

  def initialize(menu) 
    @menu = menu
    @basket = []
  end

  def add(dish, amount = 1)
    @basket.push({ dish: dish, amount: amount })  
  end

  def clear_basket 
    @basket.clear
  end 

  def list_basket 
    @basket.each do |item|
      puts "#{item[:amount]} x #{item[:dish].name}"
  end

  def total 
    raise 'Basket is empty' if empty_basket?
    @basket.map { |item| item[:amount] * item[:dish].price }.reduce(:+)
  end


  # private

  def on_menu?(dish)
    @menu.include(dish)
  end

  def empty_basket
    @basket.empty?
  end

end
end