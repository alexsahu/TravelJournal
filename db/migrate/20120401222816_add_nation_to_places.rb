class AddNationToPlaces < ActiveRecord::Migration
  def change
    remove_column :places , :country
    add_column :places, :nation, :string
  end
end
