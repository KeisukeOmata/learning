class Admins::ItemsController < ApplicationController

  before_action :authenticate_admin!

  def new
    # paramsにIDが含まれる場合はIDを取得してフォームを編集可能状態にします
    if params[:id].present?
      @item = Item.find(params[:id])
    # paramsにIDがない場合は空の値を渡してフォームを新規登録可能状態にします
    else
      @item = Item.new
    end
    @items = Item.all
    # 子、孫テーブルの登録に必要
    @disc = @item.discs.build
    @tracklist = @disc.tracklists.build
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to item_path(@item.id)
    else
      @items = Item.all
      @disc = @item.discs.build
      @tracklist = @disc.tracklists.build
      render :new
    end
  end

  def update
    @item = Item.find(params[:id])
    if @item.update(item_params)
      redirect_to item_path(@item)
    else
      flash[:alert] = "商品の編集に失敗しました！"
      redirect_to item_path(@item)
    end
  end

  def destroy
    @item = Item.find(params[:id])
    @item.destroy
    redirect_to items_path
  end

  private
  def item_params
    #_attributesで、モデルの全てのカラムと属性を取得する
    #モデルに追加したallow_destroy: trueで使う削除フラグを、ストロングパラメーターに記載(_destroy)
    #ドキュメントによると:idと:_destroyは必須だそうで。
    params.require(:item).permit(:label_id, :category_id, :artist_id, :image, :item_name, :item_price, :stocks, :item_status, discs_attributes: [:id, :disc_name, :_destroy,
                                                                                tracklists_attributes: [:id, :track_name, :song_order, :_destroy,
                                                                                cart_items_attributes: [:id, :item_quantity, :_destroy]]])
  end

end