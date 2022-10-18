class ExchangesController < ApplicationController
  before_action :set_exchange, only: %i[show update destroy]

  def index
    @exchanges = Exchange.all
    render json: @exchanges
  end

  def new
    @exchange = Exchange.new
  end

  def create
    @exchange = Exchange.new(exchange_params)
    usd_currency if @exchange.from == 'usd' && @exchange.to == 'eur'
    eur_currency if @exchange.from == 'cad' && @exchange.to == 'usd'
    gbp_currency if @exchange.from == 'gbp' && @exchange.to == 'eur'
    aud_currency if @exchange.from == 'aud' && @exchange.to == 'eur'

    if @exchange.save
      render json: { success: true, message: 'Exchange created successfully', exchange: @exchange }, status: :created
    else
      render json: { success: false, exchange: @exchange.errors }, status: :unprocessable_entity
    end
  end

  def usd_currency
    @exchange.amount_converted = @exchange.amount * 0.90
    Exchange.last.update!(amount_converted: @exchange.amount_converted)
  end

  def eur_currency
    @exchange.amount_converted = @exchange.amount / 1.31
    Exchange.last.update!(amount_converted: @exchange.amount_converted)
  end

  def gbp_currency
    @exchange.amount_converted = @exchange.amount * 1.16
    Exchange.last.update!(amount_converted: @exchange.amount_converted)
  end

  def aud_currency
    @exchange.amount_converted = @exchange.amount * 0.685
    Exchange.last.update!(amount_converted: @exchange.amount_converted)
  end

  private

  def exchange_params
    params.require(:exchange).permit(:amount, :from, :to, :amount_converted)
  end
end
