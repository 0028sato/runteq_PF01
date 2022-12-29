class CreateSnowBoards < ActiveRecord::Migration[6.1]
  def change
    create_table :snow_boards do |t|
      t.string :board_name
      t.text :board_information

      t.timestamps
    end
  end
end
