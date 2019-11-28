class User < ApplicationRecord
  
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  # passwardの入力なしでユーザー情報をupdateするメソッドを定義してます
  def update_without_current_password(params, *options)
    params.delete(:current_password)
    if params[:password].blank? && params[:password_confirmation].blank?
      params.delete(:password)
      params.delete(:password_confirmation)
    end
    result = update_attributes(params, *options)
    clean_up_passwords
    result
  end

  # paranoiaによる論理削除に必要
  acts_as_paranoid

  has_many :orders
  has_many :cart_items
  has_many :addresses, inverse_of: :user, dependent: :destroy
  # accepts_nested_attributes_forは、親子関係のある関連モデルで、親から子を作成したり保存したりするときに使用
  # 親のformに子のフィールドを追加するだけで一気にcreate, updateできるようになる
  # allow_destroy: trueは、動的に削除するために必要
  accepts_nested_attributes_for :addresses, reject_if: :all_blank, allow_destroy: true

  validates :family_name, presence: true, length: { minimum: 1, maximum: 10 }
  validates :first_name, presence: true, length: { minimum: 1, maximum: 10 }
  validates :family_name_kana, presence: true, length: { minimum: 1, maximum: 10 }
  validates :first_name_kana, presence: true, length: { minimum: 1, maximum: 10 }
  validates :phone_number, presence: true, numericality: true, length: { maximum: 15 }
  validates :postal_code, presence: true, numericality: true, length: { is: 7 }
  validates :street_address, presence: true, length: { minimum: 8, maximum: 50 }

  # カート内の金額合計
  def total_price
    cart_items = CartItem.where(user_id: id)
    cart_item = cart_items.to_a.sum { |cart_item| cart_item.items_price }
  end

  # カート内の金額の合計＋送料
  def total_cost
      total_price + 500
  end

end
