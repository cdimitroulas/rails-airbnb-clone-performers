class CreateBookings < ActiveRecord::Migration[5.0]
  def change
    create_table :bookings do |t|
      t.datetime :start_time
      t.datetime :end_time
      t.integer :price
      t.string :location
      t.references :user, foreign_key: true
      t.references :performer, foreign_key: true

      t.timestamps
    end
  end
end
