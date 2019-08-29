class CreateReviews < ActiveRecord::Migration[5.2]
  def change
    create_table :reviews do |t|
      t.text :content
      t.text :title
      t.text :text
      t.timestamps
    end
  end
end
