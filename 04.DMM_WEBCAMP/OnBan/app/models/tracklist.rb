class Tracklist < ApplicationRecord

  belongs_to :disc

  validates :track_name, presence: true
  # numericality: true だと nil を受け付けない
  validates :song_order, presence: true, numericality: true

 end