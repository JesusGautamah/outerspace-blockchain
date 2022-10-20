class CreateBlocks < ActiveRecord::Migration[7.0]
  def change
    create_table :blocks do |t|
      t.integer :nonce
      t.string :previous_hash
      t.text :block_data
      t.string :connections

      t.timestamps
    end
  end
end
