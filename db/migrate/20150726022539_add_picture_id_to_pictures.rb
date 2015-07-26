class AddPictureIdToPictures < ActiveRecord::Migration
  def change
    add_column :pictures, :picture_id, :string
  end
end
