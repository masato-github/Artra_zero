class CreateReviews < ActiveRecord::Migration[5.2]
  def change
    create_table :reviews do |t|
      t.text         :title
      t.text         :text
      t.string      :image
      t.timestamps
    end
  end
end
