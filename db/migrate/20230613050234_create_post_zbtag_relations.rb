class CreatePostZbtagRelations < ActiveRecord::Migration[6.1]
  def change
    create_table :post_zbtag_relations do |t|
      t.references :post_event, null: false, foreign_key: true
      t.references :zb, null: false, foreign_key: true

      t.timestamps
    end
  end
end
