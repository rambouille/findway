class AddChatRoomToMessages < ActiveRecord::Migration[5.2]
  def change
    add_column :messages, :chat_room_id, :integer
  end
end
