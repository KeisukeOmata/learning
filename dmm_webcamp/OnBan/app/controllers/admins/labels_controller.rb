class Admins::LabelsController < ApplicationController

  before_action :authenticate_admin!

  def index
    @labels = Label.page(params[:page]).reverse_order.per(10)
    # paramsにIDが含まれる場合はIDを取得してフォームを編集可能状態にします
    if params[:id].present?
      @label = Label.find(params[:id])
    # paramsにIDがない場合は空の値を渡してフォームを新規登録可能状態にします
    else
      @label = Label.new
    end
  end

  def create
    label = Label.new(label_params)
    if label.save
      redirect_to admins_labels_path
    else
      flash[:alert] = "レーベル名の新規登録に失敗しました！"
      @label = Label.new
      @labels = Label.all
      render :index
    end
  end

  def update
    label = Label.find(params[:id])
    if label.update(label_params)
      redirect_to admins_labels_path
    else
      flash[:alert] = "レーベル名の更新に失敗しました！"
      @label = Label.find(params[:id])
      @labels = Label.all
      redirect_to request.referer
    end
  end

  def destroy
    label = Label.find(params[:id])
    label.destroy
    redirect_to admins_labels_path
  end

  private
  def label_params
    params.require(:label).permit(:label_name)
  end

end