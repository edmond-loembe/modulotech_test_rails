class AddCapacityToRooms < ActiveRecord::Migration[7.1]
  def change
    add_column :rooms, :capacity, :integer
  end
end
