class CreateContracts < ActiveRecord::Migration[7.0]
  def change
    create_table :contracts do |t|
      t.integer :signatures_count, default: 0, null: false
      t.integer :status, default: 0, null: false
      t.integer :transaction_id, null: false

      t.timestamps
    end
  end
end
