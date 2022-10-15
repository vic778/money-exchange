class Exchange < ApplicationRecord
    after_create :save!

    def save!
        create_or_update || raise(RecordNotSaved)
    end

    # def create_or_update
    #     self.currency_data = currency_data()
    #     super
    # end

    # def currency_data
    #     # url = URI("https://api.apilayer.com/fixer/latest")
    #     url = URI("https://api.apilayer.com/currency_data/list")

    #     https = Net::HTTP.new(url.host, url.port);
    #     https.use_ssl = true
        
    #     request = Net::HTTP::Get.new(url)
    #     request['apikey'] = "9aMBOMPD3Az3URY0ZXnFnF8AH3oYQWPm"
        
    #     response = https.request(request)
    #     return response.read_body
    # end
end
