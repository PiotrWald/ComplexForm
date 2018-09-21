class Company < ApplicationRecord
  belongs_to :user, optional: true
  has_one :address
  accepts_nested_attributes_for :address, allow_destroy: true, reject_if: :all_blank
  validates :name, length: { maximum: 200 }
end