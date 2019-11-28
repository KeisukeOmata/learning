class OrderDetail < ApplicationRecord

    belongs_to :order, optional: true

    # 商品単価＊購入個数
    def order_items_price
      item_price * item_quantity * 1.08
    end
    
end
