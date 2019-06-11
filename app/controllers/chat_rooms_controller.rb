class ChatRoomsController < ApplicationController
  def show
    if current_user.status == 'coach'
      @chat_rooms = ChatRoom.where(coach: current_user)
      @interlocutor_status = 'client'
    else
      @chat_rooms = ChatRoom.where(client: current_user)
      @interlocutor_status = 'coach'
    end
    @chat_room = ChatRoom.includes(messages: :user).find(params[:id])
    # authorize @chatroom
  end
end
