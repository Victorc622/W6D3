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
        class_name: :ArtworkShare

    has_many :shared_viewers,
        through: :artwork_shares,
        source: :viewer
end
