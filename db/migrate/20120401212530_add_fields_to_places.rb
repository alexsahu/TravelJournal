class AddFieldsToPlaces < ActiveRecord::Migration
  def change
    change_table(:places) do |t|
      t.string :phone_number
      t.string :display_address
      t.string :city
      t.string :country
    end
  end
end
