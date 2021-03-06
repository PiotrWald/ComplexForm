class Address < ApplicationRecord
  belongs_to :user, optional: true
  belongs_to :company, optional: true

  validates_presence_of :street, :city, :zip_code, :country, if: :for_user?
  validates :country, inclusion:{ in:ISO3166::Country.all.map(&:alpha2) }, allow_blank: true
  validates :zip_code, zipcode: { country_code_attribute: :country }, allow_blank: true

  def for_user?
    user_id.present?
  end
end
