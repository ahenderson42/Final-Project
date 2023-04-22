class CheckoutController < ApplicationController
  def invoice
    puts params[:province]
    @province = Province.find(params[:province])
    puts @province
  end

  def info

  end

  def create

    Stripe.api_key = Rails.configuration.stripe[:secret_key]

    @session = Stripe::Checkout::Session.create(
      payment_method_types: ["card"],
      success_url: checkout_success_url + "?session_id={CHECKOUT_SESSION_ID}",
      cancel_url: checkout_cancel_url,
      line_items: [{
        price_data: {
          currency: "cad",
          unit_amount: params[:total_cost].to_i * 100,
          product_data: {
            name: "Total",
          },
        },
        quantity: 1
      },
        taxes={
          gst: {
            name: 'GST',
            unit_price: (params[:total_cost].to_i * 100) * @province.gst,
            currency: 'cad',
            quantity: 1
          },
          pst: {
            name: 'PST',
            unit_price: (params[:total_cost].to_i * 100) * @province.pst,
            currency: 'cad',
            quantity: 1
          },
          hst: {
            name: 'HST',
            unit_price: (params[:total_cost].to_i * 100) * @province.hst,
            currency: 'cad',
            quantity: 1
          }
        }
      ],
      mode: 'payment'
    )

    redirect_to @session.url, allow_other_host: true
  end

  def success
    # we took the customer's money
    @session = Stripe::Checkout::Session.retrieve(params[:session_id])
    @payment_intent = Stripe::PaymentIntent.retrieve(@session.payment_intent)

  end

  def cancel
    # something went wrong with payment!
  end
end
