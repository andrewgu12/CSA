class Rename < ActiveRecord::Migration
  def change
      rename_table :registrations, :registers
  end
end
