class CreateTransactions < ActiveRecord::Migration[7.0]
  def change
    create_table :transactions do |t|
      t.string :sender_key, null: false
      t.string :receiver_key, null: false
      t.time :signature_time, null: false
      t.integer :status, null: false, default: 0
      t.text :data
      t.string :upl_file
      t.string :upl_file_name
      t.string :upl_file_type
      t.string :upl_file_size
      t.string :upl_file_hash
      t.float :amount, null: false, default: 0.0, precision: 10, scale: 2
      t.float :fee, null: false, default: 0.0, precision: 10, scale: 2

      t.timestamps
    end
  end
end
