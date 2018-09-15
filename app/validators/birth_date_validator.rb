class BirthDateValidator < ActiveModel::Validator
  def validate(record)
    date = record.birth_date
    return if date.nil?

    unless in_the_past?(date)
      record.errors[:birth_date] << 'should be in the past'      
    end
  end

  private

  def in_the_past? date
    date < Date.today
  end
end