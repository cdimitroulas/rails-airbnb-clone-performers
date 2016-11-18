class AddColumnMessageToBookings < ActiveRecord::Migration[5.0]
  def change
    add_column :bookings, :message, :text
  end
end
