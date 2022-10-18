require 'json'
require 'net/http'
require 'httparty'

class ExchangesController < ApplicationController

  def index; end

  def show
    @exchange = Exchange.find(params[:id])
  end

  def new
    @exchange = Exchange.new
  end

  def create
    # update_currency
    @exchange = Exchange.new(exchange_params)
    usd_currency if @exchange.from == 'usd' && @exchange.to == 'eur'
    eur_currency if @exchange.from == 'cad' && @exchange.to == 'usd'
    gbp_currency if @exchange.from == 'gbp' && @exchange.to == 'eur'
    aud_currency if @exchange.from == 'aud' && @exchange.to == 'eur'

    respond_to do |format|
      if @exchange.save
        # format.turbo_stream do
        #   render turbo_stream: [
        #     turbo_stream.update('new_exchange', partial: 'exchanges/form', locals: { exchange: Exchange.new }),
        #     turbo_stream.prepend('exchange', partial: 'exchanges/exchange', locals: { exchange: @exchange })

        #   ]
        # end
        format.html { redirect_to @exchange, notice: 'Exchange was successfully created.' }
        format.json { render :show, status: :created, location: @exchange }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @exchange.errors, status: :unprocessable_entity }
      end
    end
  end

  def usd_currency
    @exchange.amount_converted = @exchange.amount * 0.90
    @exchange.save
    Exchange.last.update!(amount_converted: @exchange.amount_converted)
  end

  def eur_currency
    @exchange.amount_converted = @exchange.amount / 1.31
    @exchange.save
    Exchange.last.update!(amount_converted: @exchange.amount_converted)
  end

  def gbp_currency
    @exchange.amount_converted = @exchange.amount * 1.16
    @exchange.save
    Exchange.last.update!(amount_converted: @exchange.amount_converted)
  end

  def aud_currency
    @exchange.amount_converted = @exchange.amount * 0.685
    @exchange.save
    Exchange.last.update!(amount_converted: @exchange.amount_converted)
  end

  def update_currency
    url = URI("https://api.apilayer.com/fixer/latest")
  
    https = Net::HTTP.new(url.host, url.port);
    https.use_ssl = true
    
    request = Net::HTTP::Get.new(url)
    request['apikey'] = "6n6ZUfT4WVoRBN8EbAk4kSnplNskUOlR"
    
    response = https.request(request)
    res = JSON.parse(response.read_body)
    res["rates"]
    @curreny = Currency.new(name: res["rates"])
    @curreny.save
  
   end

  private

  def exchange_params
    params.require(:exchange).permit(:amount, :from, :to, :amount_converted)
  end
end
