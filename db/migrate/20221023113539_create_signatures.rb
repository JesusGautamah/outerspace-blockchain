class CreateSignatures < ActiveRecord::Migration[7.0]
  def change
    create_table :signatures do |t|
      t.string :signature, null: false
      t.datetime :time_ref, null: false
      t.references :contract, null: false, foreign_key: true
      t.string :common_word, null: false
      t.string :symbol_sequence, null: false
      t.string :number_sequence, null: false
      t.string :verify_sig, null: false
      t.string :block_hash, null: false
      t.string :signature_hash, null: false

      t.timestamps
    end
  end
end
