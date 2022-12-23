class RenameBodyColumnToInformation < ActiveRecord::Migration[6.1]
  def change
    rename_column :taxonomies, :body, :information
  end
end
