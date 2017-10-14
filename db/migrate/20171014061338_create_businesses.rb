class CreateBusinesses < ActiveRecord::Migration[5.1]
  def change
    create_table :businesses do |t|
      t.string :name
      t.text :description
      t.string :location
      t.string :phone
      t.string :facebook
      t.string :google
      t.string :yelp
      t.string :instagram
      t.string :twitter
      t.string :website
      t.text :html
      t.integer :user_id

      t.timestamps
    end
  end
end
