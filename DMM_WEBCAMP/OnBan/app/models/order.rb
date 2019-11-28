class Order < ApplicationRecord

  belongs_to :user
  has_many :order_details, inverse_of: :order, dependent: :destroy
  # accepts_nested_attributes_forは、親子関係のある関連モデルで、親から子を作成したり保存したりするときに使用
  # 親のformに子のフィールドを追加するだけで一気にcreate, updateできるようになる
  # allow_destroy: trueは、動的に削除するために必要
  accepts_nested_attributes_for :order_details, reject_if: :all_blank, allow_destroy: true

  enum shipping_status: { 準備中: 0, 発送済: 1 }
  enum payment: { 代引き: 0, 銀行振込: 1, クレジットカード: 2 }

  validates :payment, presence: true

  # 1オーダーの個数合計
  def total_quantity
    OrderDetail.where(order_id: id).sum(:item_quantity)
  end

  # カートではなく、オーダーの金額合計
  def order_total_price
    order_items = OrderDetail.where(order_id: id)
    order_item = order_items.to_a.sum { |order_item| order_item.order_items_price }
  end

  # オーダー＋送料
  def order_total_cost
    order_total_price + 500
  end

end