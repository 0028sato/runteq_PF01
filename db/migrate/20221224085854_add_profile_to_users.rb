class AddProfileToUsers < ActiveRecord::Migration[6.1]
  def change
    add_column :users, :gender, :integer, default: 0, null: false
    add_column :users, :age, :integer, default: 0, null: false
    add_column :users, :avatar, :string
    add_column :users, :introduction, :text
  end
end
