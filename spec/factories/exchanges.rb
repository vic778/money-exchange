FactoryBot.define do
  factory :exchange do
    from { "MyString" }
    to { "MyString" }
    amount { 1.5 }
    amount_converted { 1.5 }
  end
end
