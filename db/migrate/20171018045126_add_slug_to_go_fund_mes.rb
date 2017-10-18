class AddSlugToGoFundMes < ActiveRecord::Migration[5.1]
  def change
    add_column :go_fund_mes, :slug, :string
    add_index :go_fund_mes, :slug, unique: true
  end
end
