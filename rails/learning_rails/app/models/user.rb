class User < ApplicationRecord

  # Active Storage
  has_many_attached :portrait
end
