class Api::V1::ExchangesController < ApplicationController
  def exchange
    de = Currency.find_by(name: params[:from])
    a = Currency.find_by(name: params[:to])

    from = params[:from]
    to = params[:to]

    amount = params[:amount].to_f
    # amount_converted = amount * to.currency if from == 'USD' && to == 'EUR'
    amount_converted = amount * a.currency if from == 'USD' && to == 'EUR'
    amount_converted = amount * a.currency if from == 'GBP' && to == 'EUR'
    amount_converted = amount * a.currency if from == 'AUD' && to == 'EUR'
    amount_converted = amount / a.currency if from == 'EAD' && to == 'USD'
    amount_converted = amount * a.currency if from == 'USD' && to == 'EUR'
    amount_converted = amount * a.currency if from == 'USD' && to == 'UGX'
    amount_converted = amount * a.currency if from == 'USD' && to == 'GHS'
    render json: { success: true, message: "Exchange succefully", amount_converted: amount_converted }, status: :ok if amount_converted
  end
end
