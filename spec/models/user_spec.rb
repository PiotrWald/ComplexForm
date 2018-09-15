require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'creation' do
    context 'with valid params' do
      it 'should pass validaton' do
        expect { FactoryBot.create(:user) }.to_not raise_error
      end

      it 'should pass validation when birth_date is empty' do
        user = FactoryBot.build(:user)
        user.birth_date = nil
        expect { user.save! }.to_not raise_error
      end

      it 'should pass validation when phone_number is empty' do
        user = FactoryBot.build(:user)
        user.phone_number = nil
        expect { user.save! }.to_not raise_error
      end  
    end

    context 'with invalid params' do
      it 'should fail validaton when first_name is empty' do
        user = FactoryBot.build(:user)
        user.first_name = nil
        expect { user.save! }.to raise_error( ActiveRecord::RecordInvalid )
      end

      it 'should fail validaton when first_name has more than 100 chars' do
        user = FactoryBot.build(:user)
        user.first_name = Array.new(101).map!(&:to_i).join
        expect { user.save! }.to raise_error( ActiveRecord::RecordInvalid )
      end

      it 'should fail validaton when last_name is empty' do
        user = FactoryBot.build(:user)
        user.last_name = nil
        expect { user.save! }.to raise_error( ActiveRecord::RecordInvalid )
      end

      it 'should fail validaton when last_name has more than 100 chars' do
        user = FactoryBot.build(:user)
        user.last_name = Array.new(101).map!(&:to_i).join
        expect { user.save! }.to raise_error( ActiveRecord::RecordInvalid )
      end

      it 'should fail validaton when email is empty' do
        user = FactoryBot.build(:user)
        user.email = nil
        expect { user.save! }.to raise_error( ActiveRecord::RecordInvalid )
      end

      it 'should fail validaton when email is incorrect #1 case' do
        user = FactoryBot.build(:user)
        user.email = '@test.com'
        expect { user.save! }.to raise_error( ActiveRecord::RecordInvalid )
      end

      it 'should fail validaton when email is incorrect #2 case' do
        user = FactoryBot.build(:user)
        user.email = 'example@com'
        expect { user.save! }.to raise_error( ActiveRecord::RecordInvalid )
      end

      it 'should fail validation when birth_date isnt in correct format' do
        user = FactoryBot.build(:user)
        user.birth_date = '1232321443'
        expect { user.save! }.to raise_error( ActiveRecord::RecordInvalid )
      end

      it 'should fail validation when birth_date isnt in the past' do
        user = FactoryBot.build(:user)
        user.birth_date = 'example@com'
        expect { user.save! }.to raise_error( ActiveRecord::RecordInvalid )       
      end

      it 'should fails validation when phone_number isnt in correct format' do
        user = FactoryBot.build(:user)
        user.phone_number = '22-2-13-9201213'
        expect { user.save! }.to raise_error( ActiveRecord::RecordInvalid )          
      end
    end
  end
end
