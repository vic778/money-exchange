class Currency < ApplicationRecord
  # serialize :name
  FROM = %w[USD EUR GBP AUD CAD EAD UGX].freeze
  TO = %w[USD EUR GBP AUD CAD EAD UGX].freeze
end
