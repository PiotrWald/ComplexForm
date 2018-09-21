class UsersController < ApplicationController
  def new
    @user = User.new
    @user.build_company.build_address
    @user.build_address
  end

  def create
    @user = User.create(user_params)
    @user.build_address if @user.address.nil?
    @user.company.build_address if @user.company.address.nil?
    if not @user.id.nil?
      redirect_to users_path
    else
      render :new
    end
  end

  def destroy
    User.delete_all
  end

  def index
    @users = User.all
  end

  private

  def user_params
    params.require(:user).permit(:first_name, :last_name, :birth_date, :email, :company, :address,:phone_number,
      address_attributes: [ :city, :country, :zip_code, :street, :_delete ],
      company_attributes: [ :name, :_delete,
      address_attributes: [ :city, :country, :zip_code, :street, :_delete ]])
  end
end