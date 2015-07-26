class CreatePictures < ActiveRecord::Migration
  def change
    create_table :pictures do |t|
      t.string :event_id
      t.string :name
      t.integer :year
      t.string :link

      t.timestamps null: false
    end
  end
end
