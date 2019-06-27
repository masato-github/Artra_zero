class RemoveTextFromReviews < ActiveRecord::Migration[5.2]
  def change
    remove_column :reviews, :text, :text
  end
end
