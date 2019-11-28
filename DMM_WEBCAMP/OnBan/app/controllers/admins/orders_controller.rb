class Admins::OrdersController < ApplicationController

  before_action :authenticate_admin!

  def index
    @orders = Order.page(params[:page]).reverse_order.per(30)
  end

  def show
    @order = Order.find(params[:id])
    @order_details = @order.order_details
  end

  def update
    @order = Order.find(params[:id])
    @order.update(order_params)
  	redirect_to admins_orders_path
  end

  private
  def order_params
    params.require(:order).permit(:payment, :shipping_cost, :shipping_status, :shipping_date, :total_cost, :postal_code, :street_address, :family_name, :first_name)
  end

end
