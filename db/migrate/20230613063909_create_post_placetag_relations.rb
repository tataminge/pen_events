class CreatePostPlacetagRelations < ActiveRecord::Migration[6.1]
  def change
    create_table :post_placetag_relations do |t|
      t.references :post_event, null: false, foreign_key: true
      t.references :place, null: false, foreign_key: true

      t.timestamps
    end
  end
end
