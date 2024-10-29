class CreateRooms < ActiveRecord::Migration[7.2]
  def change
    create_table :rooms do |t|
      t.integer :number
      t.string :room_type

      t.timestamps
    end
  end
end
