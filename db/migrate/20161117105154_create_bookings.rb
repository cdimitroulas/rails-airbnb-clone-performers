class CreateBookings < ActiveRecord::Migration[5.0]
  def change
    create_table :bookings do |t|
      t.string :start_time
      t.string :end_time
      t.integer :price
      t.string :location

      t.timestamps
    end
  end
end
