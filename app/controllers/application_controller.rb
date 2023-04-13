class ApplicationController < ActionController::Base
  before_action :initialize_session
  helper_method :cart

  def initialize_session
    # this will initialize shopping cart
    session[:shopping_cart] ||= [] # empty array of product IDs
  end

  def cart
    Product.find(session[:shopping_cart]) # pass an array of ids and we get back a collection of products
  end
end
