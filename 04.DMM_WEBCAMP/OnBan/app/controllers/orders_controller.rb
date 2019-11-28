class OrdersController < ApplicationController

  before_action :authenticate_user!

  def thanks
  end

  def new
    # カートが空の状態でお会計に進もうとした場合は、elseでTopページにリダイレクトします
    have = CartItem.find_by(user_id: current_user)
    if have 
    @order = Order.new(shipping_cost: 500)
    @order_detail = @order.order_details.build
    @user = User.find(current_user.id)
    @addresses = @user.addresses.all
    @cart_items = CartItem.where(user_id: current_user.id)
    else
    redirect_to items_path
    end
  end

  def create
    # methodにはラジオボタンで選択した送付先住所のvalueが入っています
    # 初期値はユーザーの現住所。valueは0
    # valueが0でなければ、addressテーブルの情報をorderに保存
    if params[:method].to_i != 0
    @send = Address.find(params[:method])
    @order = Order.new(postal_code: @send.other_postal_code, receiver_user: @send.receiver_user, street_address: @send.other_street_address, shipping_cost: 500, family_name: current_user.family_name, first_name: current_user.first_name, user_id: current_user.id, payment: params[:payment], total_cost: current_user.total_cost, shipping_date: Time.now, shipping_status: 0)
    # valueが0の場合は、userテーブルの情報をorderに保存
    else
    @order = Order.new(postal_code: current_user.postal_code, receiver_user: current_user.family_name + current_user.first_name, street_address: current_user.street_address, shipping_cost: 500, family_name: current_user.family_name, first_name: current_user.first_name, user_id: current_user.id, payment: params[:payment], total_cost: current_user.total_cost, shipping_date: Time.now, shipping_status: 0)
    end
    @order.save
    # ここからは商品の情報をorder_detailに保存
    @cart_items = CartItem.where(user_id: current_user.id)
    @cart_items.each do |i|
    @order_detail = @order.order_details.build(item_name: i.item.item_name, item_price: i.item.item_price, item_quantity: i.item_quantity)
    @order_detail.save
    end
    # 在庫調整
    # 在庫は購入完了時点で減らす
    # decrement!でsaveは不要に
    @cart_items.each do |cart_item|
    cart_item.item.decrement!(:stocks, 1 * cart_item.item_quantity)
    end
    # itemテーブルの在庫0のステータスを変更
    Item.where(stocks: 0).update_all(item_status: :販売停止中)
    # ユーザーに紐づくcartテーブルのレコードを削除
    User.find(current_user.id).cart_items.destroy_all
    redirect_to thanks_path
  end

  def show
    @order = Order.find(params[:id])
    @order_details = @order.order_details.all
  end

  # form_withを使っているので、ストロングパラメーターは不要
  # Order.new(postal_code: @send.other_postal_code ~ )の形で持たせる
end