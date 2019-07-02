class AddArtIdToChats < ActiveRecord::Migration[5.2]
  def change
    add_column :chats, :art_id, :integer
  end
end
