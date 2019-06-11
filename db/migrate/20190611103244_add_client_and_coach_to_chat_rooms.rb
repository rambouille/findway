class AddClientAndCoachToChatRooms < ActiveRecord::Migration[5.2]
  def change
    add_reference :chat_rooms, :client
    add_reference :chat_rooms, :coach
  end
end
