class Like < ApplicationRecord
  belongs_to :liker,
    primary_key: :id,
    foreign_key: :liker_id,
    class_name: :User

  belongs_to :likeable, polymorphic: true
end
