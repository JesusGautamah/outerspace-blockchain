class CreateBlocks < ActiveRecord::Migration[7.0]
  def change
    create_table :blocks do |t|
      t.integer :nonce, default: 0, null: false
      t.string :previous_hash
      t.text :block_data
      t.integer :connections, null: false, default: 0

      t.timestamps
    end
  end
end
