class AddSlugToRegistration < ActiveRecord::Migration
  def change
    add_column :registrations, :slug, :string
  end
end
