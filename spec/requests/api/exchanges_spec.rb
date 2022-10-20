require 'swagger_helper'

RSpec.describe 'api/exchanges', type: :request do
  path '/api/v1/exchange' do
    get 'Calculate the exchange rate' do
      tags 'Exchanges'
      consumes 'application/json'
      produces 'application/json'
      # parameter name: :from, in: :path, type: :string
      # parameter name: :to, in: :path, type: :string
      # parameter name: :amount, in: :path, type: :integer
      # request_example value: { some_field: 'Foo' }, name: 'basic', summary: 'Request example description'

      response '200', 'exchange created' do
        schema type: :object,
               properties: {
                 success: { type: :boolean },
                 message: { type: :string },
                 amount_converted: { type: :float }
               },
               required: %w[success message amount_converted]

        let(:exchange) { Exchange.create(from: "USD", to: "UGX", amount: 100.0, amount_converted: 373_821.83920000005) }
        run_test! do |response|
          data = JSON.parse(response.body)
          expect(response).to have_http_status(:ok)
          expect(data['success']).to eq(true)
          expect(data['message']).to eq('you have 99 request lef')
          expect(data['amount_converted']) == (373_821.83920000005)
          expect(data['amount']) == (100.0)
        end
      end

      response '422', 'invalid request' do
        let(:exchange) { Exchange.create(from: "USD") }
        # run_test!
      end
    end
  end
end
