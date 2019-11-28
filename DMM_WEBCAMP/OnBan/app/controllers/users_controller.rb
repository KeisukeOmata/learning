class UsersController < ApplicationController

  before_action :authenticate_user!
  before_action :correct_user, only: [:edit, :show, :destroy]

  def show
    @user = User.find(params[:id])
    @addresses = @user.addresses.all
    # @orders = @user.orders.page(params[:page]).reverse_order.per(10).includes(:order_details)でもいける？
    @orders = @user.orders.page(params[:page]).reverse_order.per(10)
    @order_details = OrderDetail.includes(:order).where(orders: {user_id: params[:id]})
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
    redirect_to user_path(@user)
    else
    render :edit
    end
  end

  def destroy
    @user = User.find(params[:id])
    @user.destroy
    redirect_to items_path
  end

  def correct_user
    @user = User.find(params[:id])
    if current_user != @user
      redirect_to items_path
    end
  end

  def check
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:family_name, :first_name, :family_name_kana, :first_name_kana, :phone_number, :email, :encrypted_password, :postal_code, :street_address, addresses_attributes: [:id, :other_postal_code, :other_street_address, :receiver_user, :_destroy])
  end

end