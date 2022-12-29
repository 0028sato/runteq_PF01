class CreatePostBoardRelations < ActiveRecord::Migration[6.1]
  def change
    create_table :post_board_relations do |t|
      t.references :post, null: false, foreign_key: true
      t.references :snow_board, null: false, foreign_key: true

      t.timestamps
    end
  end
end
