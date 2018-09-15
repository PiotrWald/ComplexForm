FactoryBot.define do
  factory :address do
    street { 'Rose street' }
    country { 'PL' }
    city { 'Warsaw' }
    zip_code { '02-300' }
  end
end

