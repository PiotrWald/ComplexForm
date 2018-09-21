class RegistraionService
  def initialize params
    @params = params
  end

  def save_user
    User.transaction do
      user = User.create(user_params)
      
    end
  end

  private

  def user_params params
    @params.permit(:first_name, :last_name, :phone_number, :birth_date)
  end

  def address_params params
   @params.require[:address].permit(:country, :zip_code, :street, :city)
  end

  def company_params params
    @params.require[:company].permit(:name)
  end

  def company_address_params params
    @params.require[:campany][:address].permit(:country, :zip_code, :street, :city)
  end

  def 
end