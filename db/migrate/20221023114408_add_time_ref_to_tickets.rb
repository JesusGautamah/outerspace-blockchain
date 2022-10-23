class AddTimeRefToTickets < ActiveRecord::Migration[7.0]
  def change
    add_column :tickets, :time_ref, :datetime
  end
end
