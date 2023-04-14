class CheckoutController < ApplicationController
  def invoice
    puts params[:province]
    @province = Province.find(params[:province])
    puts @province
  end

  def info

  end

  def create

  end
end
