class Item < ApplicationRecord

  belongs_to :label
  belongs_to :category
  belongs_to :artist

  has_many :cart_items, inverse_of: :item, dependent: :destroy
  accepts_nested_attributes_for :cart_items, reject_if: :all_blank, allow_destroy: true

  # dependent: :destroyで、item(親)が削除された場合discs(子)も一緒に削除
  has_many :discs, inverse_of: :item, dependent: :destroy
  # accepts_nested_attributes_forは、親子関係のある関連モデルで、親から子を作成したり保存したりするときに使用
  # 親のformに子のフィールドを追加するだけで一気にcreate, updateできるようになる
  # allow_destroy: trueは、動的に削除するために必要
  accepts_nested_attributes_for :discs, reject_if: :all_blank, allow_destroy: true
    
  attachment :image

  validates :label_id, presence: true
  validates :category_id, presence: true
  validates :artist_id, presence: true
  validates :item_name, presence: true
  # numericality: true だと nil を受け付けない
  validates :item_price, presence: true, numericality: true
  validates :stocks, presence: true, numericality: true
  validates :item_status, presence: true

  enum item_status: { 販売中: 0, 販売停止中: 1 }

  def self.search(search)
    if search
      relation = Item.joins(discs: :tracklists)
      relation.where(['item_name LIKE ? ', "%#{search}%"]).or(relation.where(['track_name LIKE ? ', "%#{search}%"]))
    else
      Item.all
    end
  end
  
end
