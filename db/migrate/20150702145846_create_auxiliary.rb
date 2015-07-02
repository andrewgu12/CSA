class CreateAuxiliary < ActiveRecord::Migration
  def change
    create_table :auxiliaries do |t|
      t.string :name
      t.string :email
      t.string :major
      t.string :expected_graduation
    end
  end
end
