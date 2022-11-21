class AddBalanceToChains < ActiveRecord::Migration[7.0]
  def change
    add_column :chains, :balance, :decimal, null: false, default: 0.0, precision: 16, scale: 2
  end
end
