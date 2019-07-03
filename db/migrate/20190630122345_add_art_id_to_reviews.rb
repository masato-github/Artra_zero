class AddArtIdToReviews < ActiveRecord::Migration[5.2]
  def change
    add_column :reviews, :art_id, :integer
  end
end
