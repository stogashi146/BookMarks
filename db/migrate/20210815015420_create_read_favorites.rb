class CreateReadFavorites < ActiveRecord::Migration[5.2]
  def change
    create_table :read_favorites do |t|
      t.integer :book_read_id
      t.integer :user_id

      t.timestamps
    end
  end
end
