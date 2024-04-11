class User < ApplicationRecord
  validates :username, presence: true

  has_many :artwork,
    primary_key: :id,
    foreign_key: :artist_id,
    inverse_of: :users,
    dependent: :destroy

  has_many :artwork_shares,
    primary_key: :id,
    foreign_key: :viewer_id,
    inverse_of: :viewer,
    dependent: :destroy

  has_many :comments,
    primary_key: :id,
    foreign_key: :author_id,
    class_name: :Comment,
    dependent: :destroy

  has_many :shared_artworks,
    through: :artwork_shares,
    source: :artwork
end
