class ItemsController < ApplicationController
  
  def index
    @items = Item.page(params[:page]).reverse_order.per(30)
    @categories = Category.all
    # アルファベット順
    @artists = Artist.all.order("artist_name")
  end

  def side_bar
    @categories = Category.all.order("category_name")
    # アルファベット順
    @artists = Artist.all.order("artist_name")
  end

  # 検索後の画面
  def search
    # 検索バーから呼ばれた場合
    if params[:search].present?
    @items = Item.search(params[:search]).page(params[:page]).reverse_order.per(30)
    # カテゴリーから呼ばれた場合
    elsif params[:category_id].present?
    @category = Category.find(params[:category_id])
    @category_items = @category.items.page(params[:page]).reverse_order.per(30)
    # アーティスト名から呼ばれた場合
    elsif params[:artist_id].present?
    @artist = Artist.find(params[:artist_id])
    @artist_items = @artist.items.page(params[:page]).reverse_order.per(30)
    # そのいずれでもない場合
    else
    @items = Item.all.page(params[:page]).reverse_order.per(30)
    end
    # アルファベット順
    @categories = Category.all.order("category_name")
    # アルファベット順
    @artists = Artist.all.order("artist_name")
  end

  def show
    @item = Item.find(params[:id])
    # includes(:tracklists)で、ディスクに紐づくtracklistsも併せて代入
    # view側で@discsをeachでまわし、それを更にdisc.tracklistsとしてeachでまわすことで、disc毎の曲を取得
    @discs = @item.discs.all.includes(:tracklists)
    @cart_item = CartItem.new
  end

  private
  def item_params
    # _attributesで、モデルの全てのカラムと属性を取得する
    #モデルに追加したallow_destroy: trueで使う削除フラグを、ストロングパラメーターに記載(_destroy)
    #ドキュメントによると:idと:_destroyは必須だそうで
    params.require(:item).permit(:label_id, :category_id, :artist_id, :image, :item_name, :item_price, :stocks, :item_status, discs_attributes: [:id, :disc_name, :_destroy,
                                                                                tracklists_attributes: [:id, :track_name, :_destroy]])
  end

end