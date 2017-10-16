class AddSlugToBizs < ActiveRecord::Migration[5.1]
  def change
    add_column :bizs, :slug, :string
    add_index :bizs, :slug, unique: true
  end
end
