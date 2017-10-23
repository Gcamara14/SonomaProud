class AddPublishedToBusiness < ActiveRecord::Migration[5.1]
  def change
    add_column :businesses, :published, :boolean, default: false
  end
end
