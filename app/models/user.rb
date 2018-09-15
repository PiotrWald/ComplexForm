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


# ● Pole First name​jest obowiązkowe
# ● Pole First name​nie może zawierać więcej niż 100 znaków
# ● Pole Last name​jest obowiązkowe
# ● Pole Last name​nie może zawierać więcej niż 100 znaków
# ● Pole Email address​jest obowiązkowe
# ● Pole Email address​musi zawierać prawidłowy adres e-mail
# ● Pole Date of birth​jest opcjonalne
# ● Pole Date of birth​musi zawierać prawidłową datę (jeżeli je wypełniono)
# ● Pole Date of birth​musi zawierać datę w przeszłości (jeżeli je wypełniono)
# ● Pole Phone number​jest opcjonalne
# ● Pole Phone number​musi zawierać prawidłowy numer telefonu (jeżeli je wypełniono)