class CreateOfficer < ActiveRecord::Migration
  def change
    create_table :officers do |t|
      t.string :name
      t.string :role
      t.string :major
      t.string :grade
      t.string :fun_fact
      t.string :name_id
      t.timestamps null: false
    end
  end
end
