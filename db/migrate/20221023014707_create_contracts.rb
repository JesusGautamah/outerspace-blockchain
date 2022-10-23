class CreateContracts < ActiveRecord::Migration[7.0]
  def change
    create_table :contracts do |t|
      t.string :first_sig
      t.string :second_sig
      t.string :third_sig
      t.string :fourth_sig
      t.integer :status, default: 0, null: false
      t.integer :transaction_id, null: false


      t.timestamps
    end
  end
end
