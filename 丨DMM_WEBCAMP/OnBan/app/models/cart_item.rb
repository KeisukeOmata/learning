class CartItem < ApplicationRecord

  #optional: trueでbelongs_toの外部キーのnilを許可
  belongs_to :user, optional: true
  belongs_to :item, optional: true

  #カートに入れる際、0を選択不可に(:greater_than_or_equal_to => 1で、1以上)
  validates :item_quantity,  presence: true, numericality: {greater_than_or_equal_to: 1}

  def items_price
    item.item_price * item_quantity * 1.08
  end
  
end