# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
Comment.destroy_all
ArtworkShare.destroy_all
Artwork.destroy_all
User.destroy_all

victor = User.create(username: 'victor123')
edison = User.create(username: 'edison205')
kyle = User.create(username: 'kyle123')

cat_picture = Artwork.create(title: 'cat_meow', image_url: 'www.cat.com', artist_id: kyle.id)
dog_image = Artwork.create(title: 'dog_bark', image_url: 'www.dog.com', artist_id: victor.id)

ArtworkShare.create(artwork_id: cat_picture.id, viewer_id: victor.id)
ArtworkShare.create(artwork_id: dog_image.id, viewer_id: edison.id)

Comment.create(author_id: victor.id, artwork_id: cat_picture.id, body: 'This cat painting is great!')
Comment.create(author_id: edison.id, artwork_id: dog_image.id, body: 'This dog painting is good')
