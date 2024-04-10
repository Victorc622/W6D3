class User < ApplicationRecord
  validates :username, presence: true

  has_many :artwork,
    primary_key: :id,
    foreign_key: :artwork_id,
    class_name: :Artwork
end
