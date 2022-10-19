class Api::V1::ExchangesController < ApplicationController
  def exchange
    de = Currency.find_by(name: params[:from])
    a = Currency.find_by(name: params[:to])

    from = params[:from]
    to = params[:to]

    puts "from: #{from}"
    puts "to: #{to}"

    amount = params[:amount].to_f
    # amount_converted = amount * to.currency if from == 'USD' && to == 'EUR'
    amount_converted = amount / a.currency if de && a && from != to
    # amount_converted = amount * to.currency if from.name == 'GBP' && to.name == 'EUR'
    # amount_converted = amount * to.currency if from.name == 'AUD' && to.name == 'EUR'
    # amount_converted = amount / to.currency if from.name == 'EAD' && to.name == 'USD'
    # amount_converted = amount * to.currency if from.name == 'USD' && to.name == 'EUR'
    # amount_converted = amount * to.currency if from.name == 'USD' && to.name == 'UGX'
    # amount_converted = amount * to.currency if from.name == 'USD' && to.name == 'GHS'
    render json: { success: true, message: "Exchange succefully", amount_converted: amount_converted }, status: :ok if amount_converted
  end
end
