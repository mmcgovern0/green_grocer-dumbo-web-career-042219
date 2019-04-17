require 'pry'
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
  
end

def apply_clearance(cart: [])
  # code here
end

def checkout(cart: [], coupons: [])
  # code here
end
