class Admins::ArtistsController < ApplicationController

  before_action :authenticate_admin!

  def index
    @artists = Artist.page(params[:page]).reverse_order.per(10)
    # paramsにIDが含まれる場合はIDを取得してフォームを編集可能状態にします
    if params[:id].present?
      @artist = Artist.find(params[:id])
    # paramsにIDがない場合は空の値を渡してフォームを新規登録可能状態にします
    else
      @artist = Artist.new
    end
  end

  def create
    artist = Artist.new(artist_params)
    if artist.save
      redirect_to admins_artists_path
    else
      flash[:alert] = "アーティスト名の新規登録に失敗しました！"
      @artist = Artist.new(artist_params)
      @artists = Artist.all
      render :index
    end
  end

  def update
    artist = Artist.find(params[:id])
    if artist.update(artist_params)
      redirect_to admins_artists_path
    else
      flash[:alert] = "アーティスト名の更新に失敗しました！"
      @artist = Artist.find(params[:id])
      @artists = Artist.all
      redirect_to request.referer
    end
  end

  def destroy
    artist = Artist.find(params[:id])
    artist.destroy
    redirect_to admins_artists_path
  end

  private
  def artist_params
    params.require(:artist).permit(:artist_name)
  end

end