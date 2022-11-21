class AddAcceptableWordListToUsers < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :acceptable_words, :text, array: true, default: [], null: false
    add_column :users, :acceptable_number_sequences, :text, array: true, default: [], null: false
    add_column :users, :acceptable_symbol_sequences, :text, array: true, default: [], null: false
  end
end
