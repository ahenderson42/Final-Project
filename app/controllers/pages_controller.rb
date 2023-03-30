class PagesController < ApplicationController
  def index
    @products = Product.limit(6)
  end
end
