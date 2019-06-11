class ChatRoomsController < ApplicationController
  def show
    @chat_room = ChatRoom.includes(messages: :user).find(params[:id])
    if current_user.coach?
      @chat_rooms = ChatRoom.where(coach: current_user)
      @interlocutor_status = 'client'
      @chat_room.update new_for_coach: false
    else
      @chat_rooms = ChatRoom.where(client: current_user)
      @interlocutor_status = 'coach'
      @chat_room.update new_for_client: false
    end
    # authorize @chatroom
  end
end
