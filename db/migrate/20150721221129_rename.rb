class Rename < ActiveRecord::Migration
  def change
      rename_table :register, :registers
  end
end
