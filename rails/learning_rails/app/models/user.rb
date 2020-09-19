class User < ApplicationRecord

  # Active Storage
  has_many_attached :portrait
  has_many :comments

  # Action Text
  has_rich_text :name
end
