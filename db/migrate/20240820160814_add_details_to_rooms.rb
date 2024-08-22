class AddDetailsToRooms < ActiveRecord::Migration[7.1]
  def change
    add_column :rooms, :name, :string
    add_column :rooms, :location, :string
    add_column :rooms, :price_per_night, :decimal
    add_column :rooms, :description, :text
  end
end
