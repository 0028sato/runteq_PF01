class CreatePostBindingRelations < ActiveRecord::Migration[6.1]
  def change
    create_table :post_binding_relations do |t|
      t.references :post, null: false, foreign_key: true
      t.references :snow_binding, null: false, foreign_key: true

      t.timestamps
    end
  end
end
