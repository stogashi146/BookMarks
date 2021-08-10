class CreateBooks < ActiveRecord::Migration[5.2]
  def change
    create_table :books do |t|
      t.string :title
      t.string :isbn
      t.string :author
      t.string :publisher_name
      t.string :sales_date
      t.string :image_url
      t.string :url

      t.timestamps
    end
  end
end
