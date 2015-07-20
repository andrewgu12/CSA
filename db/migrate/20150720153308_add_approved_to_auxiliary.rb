class AddApprovedToAuxiliary < ActiveRecord::Migration
  def change
    add_column :auxiliaries, :approved, :integer
  end
end
