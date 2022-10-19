class Api::V1::ExchangesController < ApplicationController
  def exchange
    de = Currency.find_by(name: params[:from])
    a = Currency.find_by(name: params[:to])

    @from = params[:from]
    @to = params[:to]

    amount = params[:amount].to_f
    # amount_converted = amount * to.currency if from == 'USD' && to == 'EUR'
    @amount_converted = amount * a.currency if @from == 'USD' && @to == 'EUR'
    @amount_converted = amount * a.currency if @from == 'GBP' && @to == 'EUR'
    @amount_converted = amount * a.currency if @from == 'AUD' && @to == 'EUR'
    @amount_converted = amount / a.currency if @from == 'EAD' && @to == 'USD'
    @amount_converted = amount * a.currency if @from == 'USD' && @to == 'EUR'
    @amount_converted = amount * a.currency if @from == 'USD' && @to == 'UGX'
    @amount_converted = amount * a.currency if @from == 'USD' && @to == 'GHS'
    create_statement
  end

  def create_statement
    @exchange = Exchange.new(from: @from, to: @to, amount: params[:amount], amount_converted: @amount_converted)

    render json: { success: true, message: "Exchange succefully", amount_converted: @exchange.amount_converted }, status: :ok if @exchange.save
  end

  def check_request
    total_request = 100
    if @amount_converted < total_request
      # decrease the total request
      stat = total_request -= 1
      pust "you have #{stat} request left"
    else
      puts "you have no request left"
    end
  end

  def check_statement
    @exchange = Exchange.where(from: "USD")
    render json: { success: true, message: "Exchange succefully", amount_converted: @exchange }, status: :ok if @exchange.save
  end
end
