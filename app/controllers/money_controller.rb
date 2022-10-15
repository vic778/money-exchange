require 'json'
require 'net/http'
require 'httparty'

class Money 
    # include HTTParty
#     api_key = "9aMBOMPD3Az3URY0ZXnFnF8AH3oYQWPm"

# url = "https://api.apilayer.com/currency_data/change?start_date=#{@start_date}&end_date=#{@end_date}"
#     res = HTTParty.get(url,  api_key)
# #     res = JSON.parse(res.body)
#  array = []

#     @start_date = '2021-01-01'
#     @end_date = '2022-10-15'
# #     puts "start_date: #{res}"

# url = URI("https://api.apilayer.com/currency_data/change?start_date=#{@start_date}&end_date=#{@end_date}")

# https = Net::HTTP.new(url.host, url.port);
# https.use_ssl = true

# request = Net::HTTP::Get.new(url)
# request['apikey'] = "9aMBOMPD3Az3URY0ZXnFnF8AH3oYQWPm"

# response = https.request(request)
# array << response.read_body
# puts array



    # api_url = "9aMBOMPD3Az3URY0ZXnFnF8AH3oYQWPm"
    # require "uri"
    # require "net/http"
    
    # url = URI("https://api.apilayer.com/fixer/convert?to=#{@to}&from=#{@from}&amount=#{@amount}")
    # @to = "usd"
    # @from = "EUR"
    # @amount = "100"
    
    # https = Net::HTTP.new(url.host, url.port);
    # https.use_ssl = true
    
    # request = Net::HTTP::Get.new(url)
    # request['apikey'] = "9aMBOMPD3Az3URY0ZXnFnF8AH3oYQWPm"
    
    # response = https.request(request)
    # puts response.read_body
    
    
    # https = Net::HTTP.new(url.host, url.port);
    # https.use_ssl = true
    
    # request = Net::HTTP::Get.new(url)
    # request['apikey'] = 
    
    # response = https.request(request)
    # puts response.read_body

    # url = URI("https://api.apilayer.com/fixer/latest")
    url = URI("https://api.apilayer.com/currency_data/list")

https = Net::HTTP.new(url.host, url.port);
https.use_ssl = true

request = Net::HTTP::Get.new(url)
request['apikey'] = "9aMBOMPD3Az3URY0ZXnFnF8AH3oYQWPm"

response = https.request(request)
response = JSON.parse(response.read_body)
render json: response if response
    
end