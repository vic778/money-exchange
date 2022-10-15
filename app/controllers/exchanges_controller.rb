require 'json'
require 'net/http'
require 'httparty'

class ExchangesController < ApplicationController
    skip_before_action :verify_authenticity_token


 

  def create
    currency_data = currency_data
    @exchange = Exchange.new(currency_data: currency_data)
    if @exchange.save
      render json: @exchange, status: :created, location: @exchange
    else
      render json: @exchange.errors, status: :unprocessable_entity
    end
  end

  # def currency_data
  #     url = URI("https://api.apilayer.com/fixer/latest")

  #     https = Net::HTTP.new(url.host, url.port);
  #     https.use_ssl = true
      
  #     request = Net::HTTP::Get.new(url)
  #     request['apikey'] = "9aMBOMPD3Az3URY0ZXnFnF8AH3oYQWPm"
      
  #     response = https.request(request)
  #     return response.read_body
  # end

  def index
    # url = URI("https://api.apilayer.com/fixer/latest")
    url = URI("https://api.apilayer.com/currency_data/list")

    https = Net::HTTP.new(url.host, url.port);
    https.use_ssl = true
    
    request = Net::HTTP::Get.new(url)
    request['apikey'] = "9aMBOMPD3Az3URY0ZXnFnF8AH3oYQWPm"
    
    response = https.request(request)
    response = JSON.parse(response.read_body)
    return response
    # render json: response if response
    create
  end
end
