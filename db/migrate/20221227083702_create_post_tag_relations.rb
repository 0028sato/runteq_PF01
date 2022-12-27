class CreatePostTagRelations < ActiveRecord::Migration[6.1]
  def change
    create_table :post_tag_relations do |t|
      t.references :post, null: false, foreign_key: true
      t.references :tag, null: false, foreign_key: true

      t.timestamps
    end
    add_index :post_tag_relations, [:post_id, :tag_id], unique: true
  end
end
