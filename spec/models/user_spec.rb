require 'rails_helper'

RSpec.describe User, type: :model do
  before(:each) do
    @user = FactoryBot.build(:user)
  end

  describe 'creation' do
    context 'with valid params' do
      it 'should pass validaton' do
        expect { @user.save }.to_not raise_error
      end

      it 'should pass validation when birth_date is empty' do
        @user.birth_date = nil
        expect { @user.save! }.to_not raise_error
      end

      it 'should pass validation when phone_number is empty' do
        @user.phone_number = nil
        expect { @user.save! }.to_not raise_error
      end  
    end

    context 'with invalid params' do
      it 'should fail validaton when first_name is empty' do
        @user.first_name = nil
        expect { @user.save! }.to raise_error( ActiveRecord::RecordInvalid )
      end

      it 'should fail validaton when first_name has more than 100 chars' do
        @user.first_name = Array.new(101).map!(&:to_i).join
        expect { @user.save! }.to raise_error( ActiveRecord::RecordInvalid )
      end

      it 'should fail validaton when last_name is empty' do
        @user.last_name = nil
        expect { @user.save! }.to raise_error( ActiveRecord::RecordInvalid )
      end

      it 'should fail validaton when last_name has more than 100 chars' do
        @user.last_name = Array.new(101).map!(&:to_i).join
        expect { @user.save! }.to raise_error( ActiveRecord::RecordInvalid )
      end

      it 'should fail validaton when email is empty' do
        @user.email = nil
        expect { @user.save! }.to raise_error( ActiveRecord::RecordInvalid )
      end

      it 'should fail validaton when email is incorrect #1 case' do
        @user.email = '@test.com'
        expect { @user.save! }.to raise_error( ActiveRecord::RecordInvalid )
      end

      it 'should fail validaton when email is incorrect #2 case' do
        @user.email = 'example@'
        expect { @user.save! }.to raise_error( ActiveRecord::RecordInvalid )
      end

      it 'should fail validation when birth_date isnt in the past' do
        @user.birth_date = Date.tomorrow
        expect { @user.save! }.to raise_error( ActiveRecord::RecordInvalid )       
      end

      it 'should fails validation when phone_number isnt in correct format' do
        @user.phone_number = '22-2-13-9201213'
        expect { @user.save! }.to raise_error( ActiveRecord::RecordInvalid )          
      end
    end
  end
end
