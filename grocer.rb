require 'pry'
cart =  [
  {"AVOCADO" => {:price => 3.00, :clearance => true}},
  {"KALE" => {:price => 3.00, :clearance => false}},
  {"BLACK_BEANS" => {:price => 2.50, :clearance => false}},
  {"ALMONDS" => {:price => 9.00, :clearance => false}},
  {"TEMPEH" => {:price => 3.00, :clearance => true}},
  {"CHEESE" => {:price => 6.50, :clearance => false}},
  {"BEER" => {:price => 13.00, :clearance => false}},
  {"PEANUTBUTTER" => {:price => 3.00, :clearance => true}},
  {"BEETS" => {:price => 2.50, :clearance => false}},
  {"SOY MILK" => {:price => 4.50, :clearance => true}}
]

coupons = [
  {:item => "AVOCADO", :num => 2, :cost => 5.00},
  {:item => "BEER", :num => 2, :cost => 20.00},
  {:item => "CHEESE", :num => 3, :cost => 15.00}
]

def consolidate_cart(cart)
  organized_cart = {}
  count = 0
  cart.each do |element|
    element.each do |item, hash|
      organized_cart[item] ||= hash
      organized_cart[item][:count] ||= 0
      organized_cart[item][:count] += 1
    end
  end
  organized_cart
end

def apply_coupons(cart, coupons)
  couponed_items = {}
  coupons.each do |coupon_hash|
    cart.each do |food, food_hash|
      if food == coupon_hash[:item] && food_hash[:count] >= coupon_hash[:num]
        food_hash[:count] = food_hash[:count] - coupon_hash[:num]
        new_name = coupon_hash[:item] + " W/COUPON"
        couponed_items[new_name] = {
          price: coupon_hash[:cost],
          count: 1,
          clearance: food_hash[:clearance]
        }
      end
    end
  end
  cart.merge(couponed_items)
end


def apply_clearance(cart)
  cart.each do |food, info|
    if info[:clearance]
      update_price = info[:price] * 0.80
      info[:price] = update_price.round(2)
    end
  end
  cart
end

def checkout(cart, coupons)
  consolidated_cart = consolidate_cart(cart)
  couponed_cart = apply_coupons(consolidated_cart(cart), coupons)
  final_cart = apply_clearance(couponed_cart)
  total = 0
  final_cart.each do |food, info|
    total += info[:price] * info[:count]
  end
  if total > 100
    total = total * 0.90
    total
  end
end







