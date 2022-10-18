class Exchange < ApplicationRecord
  TO = %w[usd eur gbp aud cad chf].freeze
  FROM = %w[usd eur gbp aud cad chf].freeze
  validates :amount, presence: true
  validates :from, presence: true, inclusion: { in: FROM }
  validates :to, presence: true, inclusion: { in: TO }
  #   validates :from, presence: true, inclusion: { in: currencies_options }
end
