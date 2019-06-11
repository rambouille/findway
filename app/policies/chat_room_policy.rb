class ChatRoomPolicy < ApplicationPolicy
  def show?
    user == record.coach || user == record.client
  end
end
