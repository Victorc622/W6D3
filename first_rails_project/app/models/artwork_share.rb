class ArtworkShare < ApplicationRecord
  validates :artwork_id, :viewer_id, presence: true

  belongs_to :artwork,
    primary_key: :id,
    foreign_key: :artwork_id,
    class_name: :Artwork, # Not sure if including class_name & inverse_of is allowed?
    inverse_of: :artwork_shares

  belongs_to :viewer,
    primary_key: :id,
    foreign_key: :viewer_id,
    class_name: :User, # Not sure if including class_name & inverse_of is allowed?
    inverse_of: :artwork_shares
end
