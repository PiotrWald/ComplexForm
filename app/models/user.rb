class User < ApplicationRecord
  include ActiveModel::Validations
  has_one :address, dependent: :delete
  has_one :company, dependent: :delete
  accepts_nested_attributes_for :address, allow_destroy: true, reject_if: :all_blank
  accepts_nested_attributes_for :company, allow_destroy: true, reject_if: :all_blank

  validates :first_name, presence: true, length: { maximum: 100 }
  validates :last_name, presence: true, length: { maximum: 100 }
  validates :phone_number, phone: { allow_blank: true }
  validates_presence_of :email
  validates :email, format: { with: URI::MailTo::EMAIL_REGEXP }, uniqueness: true, allow_blank: true
  validates_with BirthDateValidator
end