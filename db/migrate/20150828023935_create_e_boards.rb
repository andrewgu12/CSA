class CreateEBoards < ActiveRecord::Migration
  def change
    create_table :e_boards do |t|
      t.string :name
      t.string :role
      t.string :major
      t.string :class
      t.string :fun_fact
      t.string :name_id

      t.timestamps null: false
    end
  end
end
