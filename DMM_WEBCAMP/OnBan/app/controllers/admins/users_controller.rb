class Admins::UsersController < ApplicationController

  before_action :authenticate_admin!

  def index
    @users = User.page(params[:page]).reverse_order.per(20)
  end

  def show
    @user = User.find(params[:id])
    @addresses = @user.addresses.all
    @orders = @user.orders.page(params[:page]).reverse_order.per(10)
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      redirect_to admins_user_path(@user)
    else
      render :edit
    end
  end

  def destroy
    @user = User.find(params[:id])
    @user.destroy
    redirect_to users_path
  end

  private
  def user_params
    params.require(:user).permit(:family_name, :first_name, :family_name_kana, :first_name_kana, :phone_number, :email, :encrypted_password, :postal_code, :street_address, addresses_attributes: [:id, :other_postal_code, :other_street_address, :receiver_user, :_destroy])
  end

end