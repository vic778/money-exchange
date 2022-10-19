class Currency < ApplicationRecord
  # serialize :name
  FROM = %w[USD EUR GBP AUD CAD EAD UGX].freeze
  TO = %w[USD EUR GBP AUD CAD EAD UGX].freeze

  # validates :amount, presence: true
  # validates :from, presence: true, inclusion: { in: FROM }
  # validates :to, presence: true, inclusion: { in: TO }
end
