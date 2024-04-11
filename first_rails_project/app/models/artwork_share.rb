class ArtworkShare < ApplicationRecord
  validates :artwork_id, :viewer_id, presence: true

  belongs_to :artwork,
    primary_key: :id,
    foreign_key: :artwork_id,
    # class_name: :Artwork
    inverse_of: :shared_viewers

  belongs_to :viewer,
    primary_key: :id,
    foreign_key: :viewer_id,
    # class_name: :User
    inverse_of: :shared_artworks
end
