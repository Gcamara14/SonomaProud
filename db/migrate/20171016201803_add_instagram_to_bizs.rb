class AddInstagramToBizs < ActiveRecord::Migration[5.1]
  def change
    add_column :bizs, :instagram, :string
  end
end
