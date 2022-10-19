class Api::V1::ExchangesController < ApplicationController
  def exchange
    from = Currency.find_by(name: params[:from])
    to = Currency.find_by(name: params[:to])

    amount = params[:amount].to_f
    # amount_converted = amount * to.currency if from == 'USD' && to == 'EUR'
    amount_converted = amount / to.currency if from.name == 'CAD' && to.name == 'USD'
    amount_converted = amount * to.currency if from.name == 'GBP' && to.name == 'EUR'
    amount_converted = amount * to.currency if from.name == 'AUD' && to.name == 'EUR'
    amount_converted = amount / to.currency if from.name == 'EAD' && to.name == 'USD'
    amount_converted = amount * to.currency if from.name == 'USD' && to.name == 'EUR'
    amount_converted = amount * to.currency if from.name == 'USD' && to.name == 'UGX'
    amount_converted = amount * to.currency if from.name == 'USD' && to.name == 'GHS'
    render json: { success: true, message: "Exchange succefully", amount_converted: amount_converted } if amount_converted
  end
end
