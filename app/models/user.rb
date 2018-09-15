class User < ApplicationRecord
  include ActiveModel::Validations

  has_one :address

  validates :first_name, presence: true, length: { maximum: 100 }
  validates :last_name, presence: true, length: { maximum: 100 }
  validates :phone_number, phone: { allow_blank: true }
  validates_with BirthDateValidator

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  private

  def password_required?
    false
  end
end