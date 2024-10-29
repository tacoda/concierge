class CreateBookings < ActiveRecord::Migration[7.2]
  def change
    create_table :bookings do |t|
      t.string :guest
      t.date :start_date
      t.date :end_date
      t.references :room, null: false, foreign_key: true

      t.timestamps
    end
  end
end
