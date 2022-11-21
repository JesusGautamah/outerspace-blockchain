class CreatePools < ActiveRecord::Migration[7.0]
  def change
    create_table :pools do |t|
      t.references :block, null: false, foreign_key: true
      t.integer :users_count, default: 0, null: false
      t.integer :signatures_count, default: 0, null: false
      t.decimal :amount, null: false, default: 0.0, precision: 16, scale: 2
      t.integer :stage, default: 0, null: false

      t.timestamps
    end
  end
end
