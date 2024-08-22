class CreateImages < ActiveRecord::Migration[7.1]
  def change
    create_table :images do |t|
      t.references :room, null: false, foreign_key: true
      t.string :url

      t.timestamps
    end
  end
end
