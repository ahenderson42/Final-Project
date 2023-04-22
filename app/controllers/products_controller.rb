class ProductsController < ApplicationController
  def index
    @products = Product.all.page(params[:page]).per(6)
  end

  def show
    @product = Product.find(params[:id])
  end

  def search
    @products = Product.search(params[:search], params[:category])
  end

  def new
    @products = Product.where("created_at >= ?", 3.days.ago)
  end

  def updated
    @products = Product.where("created_at <= ? AND updated_at >= ?", 3.days.ago, 3.days.ago)
  end
end
