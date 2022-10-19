require 'json'
require 'net/http'
require 'httparty'

class ExchangesController < ApplicationController
  def index
    # update_currency
    from = Currency.find_by(name: params[:from])
    to = Currency.find_by(name: params[:to])

    amount = params[:amount].to_f
    amount_converted = amount * to.currency if from.name == 'USD' && to.name == 'EUR'
    amount_converted = amount / to.currency if from.name == 'CAD' && to.name == 'USD'
    amount_converted = amount * to.currency if from.name == 'GBP' && to.name == 'EUR'
    amount_converted = amount * to.currency if from.name == 'AUD' && to.name == 'EUR'
    amount_converted = amount / to.currency if from.name == 'EAD' && to.name == 'USD'
    amount_converted = amount * to.currency if from.name == 'USD' && to.name == 'EUR'
    amount_converted = amount * to.currency if from.name == 'USD' && to.name == 'UGX'
    render json: { amount_converted: amount_converted }
  end

  def update_currency
    url = URI("https://api.apilayer.com/fixer/latest")

    https = Net::HTTP.new(url.host, url.port)
    https.use_ssl = true

    request = Net::HTTP::Get.new(url)
    request['apikey'] = "6n6ZUfT4WVoRBN8EbAk4kSnplNskUOlR"

    response = https.request(request)
    res = JSON.parse(response.read_body)
    res["rates"].each do |key, value|
      name = key.gsub(/---/, '').gsub(/\n/, '')
      currency = value
      @currency = Currency.new(name: name, currency: currency)
      @currency.save
    end
  end
end
