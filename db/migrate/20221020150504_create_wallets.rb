class CreateWallets < ActiveRecord::Migration[7.0]
  def change
    create_table :wallets do |t|
      t.references :user, null: false, foreign_key: true
      t.string :pr_key, null: false
      t.string :pv_key, null: false
      t.decimal :balance, null: false, default: 0.0, precision: 16, scale: 2
      t.integer :status, null: false, default: 0

      t.timestamps
    end
  end
end
