require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'creation' do
    context 'user with valid parameters passes validations' do
      it 'successfuly save record with valid params' do
        FactoryBot.create(:user)
      end
    end
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