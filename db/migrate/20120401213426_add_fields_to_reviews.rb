class AddFieldsToReviews < ActiveRecord::Migration
  def change
    change_table(:reviews) do |t|
      t.string :yelp_review
      t.decimal :yelp_rating
      t.decimal :rating
    end
  end
end
