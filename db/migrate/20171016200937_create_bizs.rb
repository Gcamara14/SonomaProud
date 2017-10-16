class CreateBizs < ActiveRecord::Migration[5.1]
  def change
    create_table :bizs do |t|
      t.string :name
      t.text :description
      t.string :location
      t.string :phone
      t.string :facebook
      t.string :google
      t.string :yelp
      t.string :twitter
      t.string :website

      t.timestamps
    end
  end
end
