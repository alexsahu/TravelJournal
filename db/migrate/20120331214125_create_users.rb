class CreateUsers < ActiveRecord::Migration
  def up
    create_table :users do |t|
      t.string :username
      t.string :name
      t.string :password
      t.integer :fb_uid
      t.timestamps
    end
  end

  def down
    drop_table :users
  end
end
