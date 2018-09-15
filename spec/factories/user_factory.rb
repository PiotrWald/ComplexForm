FactoryBot.define do
  factory :user do
    first_name { 'John' }
    last_name  { 'Doe' }
    birth_date { Date.new(2000,1,1) }
    email { 'example@example.com' }
    phone_number { '+1-541-754-3010' }
  end
end