class Artwork < ApplicationRecord
    validate :title
    validates :artist_id, uniqueness: { scope: :title, message: 'combination of artist_id and title must be unique'}
    validates :image_url, uniqueness: true

    belongs_to :users,
        primary_key: :id,
        foreign_key: :artist_id,
        class_name: :User

    has_many :artwork_shares,
        primary_key: :id,
        foreign_key: :artwork_id,
        inverse_of: :artwork,
        dependent: :destroy

    has_many :comments,
        primary_key: :id,
        foreign_key: :artwork_id,
        class_name: :Comment,
        dependent: :destroy

    has_many :shared_viewers,
        through: :artwork_shares,
        source: :viewer

    def self.artworks_for_user_id(user_id)
        user = User.includes(:shared_artworks, :artwork).find(user_id)
        user.artwork + user.shared_artworks
        # .or(Artwork.joins(:artwork_shares).where(artwork_shares: { viewer_id: user_id }))
    end

end
