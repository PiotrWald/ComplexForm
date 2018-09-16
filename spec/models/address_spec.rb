require 'rails_helper'

RSpec.describe Address, type: :model do
  describe 'creation' do
    before(:each) do
      @address = FactoryBot.build(:address)
    end

    context 'for user' do
      context 'with vaild params' do
        it 'should pass validation' do
          expect { @address.save! }.to_not raise_error
        end
      end

      context 'with invalid params' do
        it 'should raise error when street is empty' do
          @address.street = nil
          expect { @address.save! }.to raise_error( ActiveRecord::RecordInvalid )  
        end

        it 'should raise error when city is empty' do
          @address.city = nil
          expect { @address.save! }.to raise_error( ActiveRecord::RecordInvalid )  
        end

        it 'should raise error when zip_code is empty' do
          @address.zip_code = nil
          expect { @address.save! }.to raise_error( ActiveRecord::RecordInvalid )  
        end

        it 'should raise error when zip_code has invalid format' do
          @address.zip_code = '-2114-'
          expect { @address.save! }.to raise_error( ActiveRecord::RecordInvalid )  
        end

        it 'should raise error when country is empty' do
          @address.country = nil
          expect { @address.save! }.to raise_error( ActiveRecord::RecordInvalid )  
        end

        it 'should raise error when country has invalid value' do
          @address.country = 'XXX'
          expect { @address.save! }.to raise_error( ActiveRecord::RecordInvalid )  
        end
      end
    end

    context 'for company' do
      context 'with valid params' do
        it 'should not raise error when street is empty' do
          @address.street = nil
          expect { @address.save! }.to_not raise_error
        end

        it 'should not raise error when street is empty' do
          @address.zip_code = nil
          expect { @address.save! }.to_not raise_error
        end

        it 'should not raise error when street is empty' do
          @address.country = nil
          expect { @address.save! }.to_not raise_error
        end

        it 'should not raise error when street is empty' do
          @address.city = nil
          expect { @address.save! }.to_not raise_error
        end
      end
    end
  end
end
