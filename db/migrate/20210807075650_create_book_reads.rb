class CreateBookReads < ActiveRecord::Migration[5.2]
  def change
    create_table :book_reads do |t|
      t.integer :user_id
      t.integer :book_id
      t.integer :rate
      t.text :comment

      t.timestamps
    end
  end
end
