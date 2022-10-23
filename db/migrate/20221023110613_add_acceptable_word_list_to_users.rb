class AddAcceptableWordListToUsers < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :acceptable_word_list, :text
  end
end
