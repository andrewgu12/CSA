class CreateRegistrations < ActiveRecord::Migration
  def change
    create_table :registrations do |t|
      t.string :firstName
      t.string :lastName
      t.string :email
      t.string :shirtSize
      t.string :year

      t.timestamps null: false
    end
  end
end
