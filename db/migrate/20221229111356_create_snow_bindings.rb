class CreateSnowBindings < ActiveRecord::Migration[6.1]
  def change
    create_table :snow_bindings do |t|
      t.string :binding_name
      t.text :binding_information

      t.timestamps
    end
  end
end
