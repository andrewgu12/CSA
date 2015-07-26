class AddEventIdToEvent < ActiveRecord::Migration
  def change
    add_column :events, :event_id, :string
  end
end
