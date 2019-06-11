class AddNewToChatRooms < ActiveRecord::Migration[5.2]
  def change
    add_column :chat_rooms, :new_for_client, :boolean
    add_column :chat_rooms, :new_for_coach, :boolean
  end
end
