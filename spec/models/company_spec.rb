require 'rails_helper'

RSpec.describe Company, type: :model do
  describe 'creation' do
    before(:each) do
      @company = FactoryBot.build(:company)
    end

    context 'with vaild params' do
      it 'should pass validation' do
        expect { @company.save! }.to_not raise_error
      end

      it 'should not raise an error when name is empty' do
        @company.name = nil
        expect { @company.save! }.to_not raise_error
      end
    end

    context 'with invalid params' do
      it 'should raise error when name has more than 200 chars' do
        @company.name = Array.new(201).map!(&:to_i).join
        expect { @company.save! }.to raise_error( ActiveRecord::RecordInvalid )  
      end
    end
  end
end
