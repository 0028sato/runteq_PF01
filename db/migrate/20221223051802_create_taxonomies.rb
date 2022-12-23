class CreateTaxonomies < ActiveRecord::Migration[6.1]
  def change
    create_table :taxonomies do |t|
      t.string :type
      t.string :name, null: false
      t.text :body, null: false

      t.references :post, null: false, foreign_key: true

      t.timestamps
    end
  end
end
