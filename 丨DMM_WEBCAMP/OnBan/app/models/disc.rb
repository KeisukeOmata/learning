class Disc < ApplicationRecord

  # dependent: :destroyで、disc(親)が削除された場合tracklists(子)も一緒に削除
  has_many :tracklists, inverse_of: :disc, dependent: :destroy
  belongs_to :item
  validates :disc_name, presence: true

  # accepts_nested_attributes_forは、親子関係のある関連モデルで、親から子を作成したり保存したりするときに使用
  # 親のformに子のフィールドを追加するだけで一気にcreate, updateできるようになる
  # allow_destroy: trueは、動的に削除するために必要
  accepts_nested_attributes_for :tracklists, reject_if: :all_blank, allow_destroy: true
  
end