class CreateSnsAcounts < ActiveRecord::Migration[5.2]
  def change
    create_table :sns_acounts do |t|
      t.integer :user_id
      t.string :twitter_id

      t.timestamps
    end
  end
end
