require 'json'
require 'net/http'
require 'httparty'

class ExchangesController < ApplicationController
  def index
    # update_currency
  end

  def new
    de = Currency.find_by(name: params[:from])
    a = Currency.find_by(name: params[:to])

    from = params[:from]
    to = params[:to]

    amount = params[:amount].to_f
    # amount_converted = amount * to.currency if from == 'USD' && to == 'EUR'
    amount_converted = amount / a.currency if from == 'USD' && to == 'EUR'
    amount_converted = amount * a.currency if from == 'GBP' && to == 'EUR'
    amount_converted = amount * a.currency if from == 'AUD' && to == 'EUR'
    amount_converted = amount / a.currency if from == 'EAD' && to == 'USD'
    amount_converted = amount * a.currency if from == 'USD' && to == 'EUR'
    amount_converted = amount * a.currency if from == 'USD' && to == 'UGX'
    amount_converted = amount * a.currency if from == 'USD' && to == 'GHS'

    if amount_converted
      puts "The amount converted is #{amount_converted}"
      respond_to do |format|
        format.html { redirect_to exchanges_path, notice: 'Exchange was successfully created.', amount_converted: amount_converted }
        format.json { render :show, status: :created, amount_converted: amount_converted }
      end
    end
  end

  def update_currency; end
end
