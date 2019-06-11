class ChatRoomsController < ApplicationController
  def show
    @chat_room = ChatRoom.includes(messages: :user).find(params[:id])
    # authorize @chatroom
  end
end
