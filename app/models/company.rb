class Company < ApplicationRecord
  has_one :address
  validates :name, length: { maximum: 200 }
end