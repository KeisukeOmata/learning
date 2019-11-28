class CartItemsController < ApplicationController

  before_action :authenticate_user!

  def index
    @cart_items = CartItem.where(user_id: current_user.id)
  end

  # 個数変更
  def update
    @cart_item = CartItem.find(params[:id])
    @cart_item.update(cart_item_params)
    redirect_to cart_items_path
  end

  # カートから削除
  def destroy
    @cart_item = CartItem.find(params[:id])
    @cart_item.destroy
    redirect_to cart_items_path
  end

  # 商品追加
  def create
    @cart_item = CartItem.new(cart_item_params)
    # URLからitem_idを持たせるため、routesでcreateのアドレスを変更しています
    @cart_item.item_id = params[:id]
    # 既にカートに同一商品が入っていれば、それを@old_itemに代入
    @old_item = CartItem.find_by(item_id: @cart_item.item_id)
    # もしカートに同一商品(@old_item)が入っていれば、@cart_itemの数量に@old_itemの数量を足し、@old_itemを削除
    if @old_item
      @cart_item.item_quantity += @old_item.item_quantity.to_i
      @old_item.destroy
    end
    # もし数量が0でなく、nilでなく、在庫数以下であればsave(カートに追加)
    if @cart_item.item_quantity != 0 && @cart_item.item_quantity != nil && @cart_item.item_quantity <= @cart_item.item.stocks
      @cart_item.user_id = current_user.id
      @cart_item.save
      redirect_to cart_items_path
    # もし数量が0、またはnil、または在庫数以上であれば、エラー表示を商品詳細画面に表示
    else
      @item = Item.find(params[:id])
      @discs = @item.discs.all
      @tracklists = Tracklist.includes(:disc).where(discs: {item_id: params[:id]}).order("song_order")
      @cart_item = CartItem.new
      flash[:alert] = "数量が0や空欄、あるいは現在の在庫数より多いです。数量を正しく入力するか減らしてください。"
      render 'items/show'
    end
  end

private
def cart_item_params
  params.require(:cart_item).permit(:item_id, :user_id, :item_quantity)
end

end
