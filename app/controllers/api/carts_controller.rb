
class Api::CartsController < ApplicationController

  def show
    @cart = CartProduct.where(cart_id: current_user.cart_id).order(created_at: :desc)
  end


  def delete_all
    @cart = CartProduct.where(cart_id: current_user.cart_id).order(created_at: :desc)
    @cart.each do |cart_product|
      cart_product.delete
    end
    @cart = CartProduct.where(cart_id: current_user.cart_id).order(created_at: :desc)
    render '/api/carts/show'
  end


end
