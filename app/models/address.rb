class Address < ApplicationRecord
  has_one :user
  has_one :company

  validates_presence_of :street, :city, :zip_code, :country
  validates :country, inclusion:{ in:ISO3166::Country.all.map(&:alpha2) }
  validates :zip_code, zipcode: { country_code_attribute: :country }
end
