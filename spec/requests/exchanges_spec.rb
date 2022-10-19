require 'rails_helper'

RSpec.describe "Exchanges", type: :request do
  describe "GET /index" do
    it "should calculate the exchange rate" do
      exchange_params = {
        from: "USD",
        to: "EUR",
        amount: 100
      }
      get "/api/v1/exchange", params: exchange_params
      expect(response).to have_http_status(204)
    end
  end
end
