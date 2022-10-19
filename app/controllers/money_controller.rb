require 'json'
require 'net/http'
require 'httparty'

class Money
  # skip_before_action :verify_authenticity_token

  # def index
  @source = "usd"
  @currencies = "eur"
  # url = URI("https://api.apilayer.com/fixer/latest")

  # url = URI("https://api.apilayer.com/fixer/latest?symbols=symbols&base=base")
  # url = URI("https://api.apilayer.com/currency_data/live?source=#{@source}&currencies=#{@currencies}")

  url = URI("https://api.apilayer.com/fixer/latest")

  https = Net::HTTP.new(url.host, url.port)
  https.use_ssl = true

  request = Net::HTTP::Get.new(url)
  request['apikey'] = "6n6ZUfT4WVoRBN8EbAk4kSnplNskUOlR"

  response = https.request(request)
  res = JSON.parse(response.read_body)
  res["rates"].each do |key, value|
    # remove --- and \n for key
    name = key.gsub(/---/, '').gsub(/\n/, '')
    currency = value
    puts name
  end

  # puts @response["quotes"]

  # @exchange = Exchange.new
  # @exchange.name = @response["quotes"]
  # @exchange.save

  # puts "here is the exchange#{@exchange}"

  # end
  # end

  # def create
  #   @response.each do |key, value|
  #     @exchange = Exchange.new
  #     @exchange.name = key
  #     @exchange.full_name = value
  #     @exchange.save
  #   end
  #   if @exchange.save
  #     render json: @exchange, status: :created, location: @exchange
  #   else
  #     render json: @exchange.errors, status: :unprocessable_entity
  #   end
  # end

  # def scope_details
  #   @array = []
  #   @response.each do |_key, value|
  #     # puts key
  #     @array << value.to_s
  #   end

  #   puts @array

  # @array.each do |value|
  #   @exchange = Exchange.new
  #   @exchange.name = value
  #   @exchange.full_name =
  #   @exchange.save
  # end
  #
  # end
end
