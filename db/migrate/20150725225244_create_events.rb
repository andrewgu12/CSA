class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.string :name
      t.text :description
      t.string :date
      t.string :pictures

      t.timestamps null: false
    end
  end
end
