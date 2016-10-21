class DeleteVolunteerTable < ActiveRecord::Migration
  def change
    drop_table :volunteer
  end
end
