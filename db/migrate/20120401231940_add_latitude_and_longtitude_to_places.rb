class AddLatitudeAndLongtitudeToPlaces < ActiveRecord::Migration
  def change
    remove_column :places , :location
    add_column :places , :latitude , :string
    add_column :places , :longitude , :string
  end
end
