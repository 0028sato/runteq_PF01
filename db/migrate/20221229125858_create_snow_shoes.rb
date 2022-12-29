class CreateSnowShoes < ActiveRecord::Migration[6.1]
  def change
    create_table :snow_shoes do |t|
      t.string :shoe_name
      t.text :shoe_information

      t.timestamps
    end
  end
end
