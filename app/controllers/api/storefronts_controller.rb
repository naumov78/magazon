class Api::StorefrontsController < ApplicationController


  def index
    storefront = Product.where(storefront: true)
    @storefront = storefront.shuffle.take(5)
  end


end