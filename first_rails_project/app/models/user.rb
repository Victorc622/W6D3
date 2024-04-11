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
  
  has_many :liked_comments,
    through: :likes,
    source: :likeable,
    source_type: "Comment"

  has_many :liked_artwork,
    through: :likes,
    source: :likeable,
    source_type: "Artwork"

    # def self.liked_artworks_and_comments_for_user_id(user_id)
    #   user = User.includes(:liked_comments, :liked_artwork).find(user_id)
    #   user.liked_artwork + user.liked_comments
    # end
end
