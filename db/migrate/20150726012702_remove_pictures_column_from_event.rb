class RemovePicturesColumnFromEvent < ActiveRecord::Migration
  def change
    remove_column :events, :pictures
  end
end
