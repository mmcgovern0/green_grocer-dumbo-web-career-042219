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
  item_name_with_coupon = {}
  coupons.each do |key, value|
    puts key
    cart.each do |food, description|
    end
  end
end


def apply_clearance(cart: [])
  # code here
end

def checkout(cart: [], coupons: [])
  # code here
end
