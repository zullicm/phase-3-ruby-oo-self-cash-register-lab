require "pry"
class CashRegister
  attr_accessor :total, :discount, :list, :price_list
  def initialize(discount = 0, total = 0, list = [], price_list = [])
    @total = total
    @discount = discount
    @list = list
    @price_list = price_list
  end

  def add_item(title, price, quantity = 1)
    total_price = price * quantity
    @total = self.total += total_price
    if quantity == 1
      self.list << title
    else
      items = "#{title}," * quantity
      array = items.split(",")
      array.map { |a| self.list << title}
    end
     price_list << total_price
  end

  def apply_discount
    if discount == 0
      "There is no discount to apply."
    else
    real_discount = self.discount / 100.to_f
    discount_amount = self.total * real_discount 
    @total = self.total - discount_amount
    int_total = @total.to_i
    "After the discount, the total comes to $#{int_total}."
    end
  end

  def items
    list
  end

  def void_last_transaction
    @total = total - price_list.pop 
  end

end
