class AddVolunteerTable < ActiveRecord::Migration
  def change
    create_table :volunteer do |t|
      t.string :email
    end
  end
end
