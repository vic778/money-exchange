require 'swagger_helper'

RSpec.describe 'api/exchanges', type: :request do
  path '/api/v1/exchange' do
    get 'Calculate the exchange rate' do
      tags 'Exchanges'
      consumes 'application/json'
      parameter name: :from, in: :path, type: :string
      parameter name: :to, in: :path, type: :string
      parameter name: :amount, in: :path, type: :integer

      response '204', 'exchange created' do
        let(:from) { 'USD' }
        let(:to) { 'EUR' }
        let(:amount) { 100 }
        # run_test!
      end

      response '422', 'invalid request' do
        let(:exchange) { { from: 'USD', to: 'EUR', amount: 100 } }
      end
    end
  end
end
