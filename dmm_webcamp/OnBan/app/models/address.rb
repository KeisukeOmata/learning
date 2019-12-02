class Address < ApplicationRecord

  belongs_to :user

  validates :other_postal_code, presence: true, length: { is: 7 }
  validates :other_street_address, presence: true, length: { minimum: 8, maximum: 80 }
  validates :receiver_user, presence: true

end
