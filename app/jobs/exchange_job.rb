class ExchangeJob < ApplicationJob
  queue_as :default

  def perform(*_args)
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
