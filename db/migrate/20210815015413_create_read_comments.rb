class CreateReadComments < ActiveRecord::Migration[5.2]
  def change
    create_table :read_comments do |t|
      t.integer :book_read_id
      t.integer :user_id
      t.text :comment

      t.timestamps
    end
  end
end
