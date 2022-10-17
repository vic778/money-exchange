class Exchange < ApplicationRecord
  currencies_options = %w[usd eur gbp aud cad chf cny dkk hkd inr jpy mxn nok nzd pln ron sek sgd thb zar]
  validates :amount, presence: true
  validates :amount_to_calculate, presence: true
  validates :currency, presence: true, inclusion: { in: currencies_options }
end
