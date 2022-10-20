class CreateChains < ActiveRecord::Migration[7.0]
  def change
    create_table :chains do |t|
      t.string :name, null: false, index: { unique: true }
      t.integer :blocks_count, null: false, default: 0
      t.string :maintainer, null: false
      t.string :chain_version, null: false
      t.text :description, null: false

      t.timestamps
    end
  end
end
