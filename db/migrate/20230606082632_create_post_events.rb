class CreatePostEvents < ActiveRecord::Migration[6.1]
  def change
    create_table :post_events do |t|
      t.integer :genre_id, null: false, foreign_key: true
      t.date :start_date, null: false
      t.date :end_date, null: false
      t.text :body, null: false
      t.string :url, null: false
      t.integer :member_id, null: false, foreign_key: true
      t.string :title, null: false

      t.timestamps
    end
  end
end
