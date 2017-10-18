class CreateGoFundMes < ActiveRecord::Migration[5.1]
  def change
    create_table :go_fund_mes do |t|
      t.string :campaign
      t.string :beneficiary
      t.text :embed
      t.integer :user_id

      t.timestamps
    end
  end
end
