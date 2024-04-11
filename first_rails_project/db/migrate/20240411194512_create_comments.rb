class CreateComments < ActiveRecord::Migration[7.0]
  def change
    create_table :comments do |t|
      t.references :author, null: false, foreign_key: { to_table: :users }
      t.references :artwork, null: false, foreign_key: { to_table: :artworks }
      t.text :body, null: false
      t.timestamps
    end

    add_index :comments, [:artwork_id, :author_id], unique: true
  end
end
