class CreatePlaces < ActiveRecord::Migration
  def up
    create_table :places do |t|
      t.string :name
      t.integer :category_id
      t.string :location
      t.timestamps
    end
  end

  def down
    drop_table :places
  end
end
