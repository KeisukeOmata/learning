class Admins::CategoriesController < ApplicationController

  before_action :authenticate_admin!

  def index
    @categories = Category.page(params[:page]).reverse_order.per(10)
    # paramsにIDが含まれる場合はIDを取得してフォームを編集可能状態にします
    if params[:id].present?
      @category = Category.find(params[:id])
    # paramsにIDがない場合は空の値を渡してフォームを新規登録可能状態にします
    else
      @category = Category.new
    end
  end

  def create
    category = Category.new(category_params)
    if category.save
      redirect_to admins_categories_path
    else
      flash[:alert] = "ジャンル名の新規登録に失敗しました！"
      @category = Category.new
      @categories = Category.all
      render :index
    end
  end

  def update
    category = Category.find(params[:id])
    if category.update(category_params)
      redirect_to admins_categories_path
    else
      flash[:alert] = "ジャンル名の更新に失敗しました！"
      @category = Category.find(params[:id])
      @categories = Category.all
      redirect_to request.referer
    end
  end

  def destroy
    category = Category.find(params[:id])
    category.destroy
    redirect_to admins_categories_path
  end

  private
  def category_params
    params.require(:category).permit(:category_name)
  end

end