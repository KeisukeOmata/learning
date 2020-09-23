class User < ApplicationRecord
  # Active Storage
  has_many_attached :portrait
  # Action Mailbox
  has_many :comments
  # Action Text
  has_rich_text :name

  # direct_upload: trueの場合、pngなどの拡張子に偽装したテキストファイルがエラーにならないので注意
  validates :portrait,
    # Active Storageの画像の拡張子に制限をかける
    content_type: [:png, :jpg, :jpeg],
    # Active Storageの画像の容量に制限をかける
    size: { less_than_or_equal_to: 10.megabytes },
    # Active Storageの画像のwidth, heightに制限をかける
    dimention: { width: { max: 2000 }, height: { max: 2000 } }
end
