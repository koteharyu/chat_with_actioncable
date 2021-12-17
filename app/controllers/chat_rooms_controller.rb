class ChatRoomsController < ApplicationController
  before_action :require_login

  def create
    current_user_chat_rooms = ChatRoomUser.where(user_id: current_user.id).map(&:chat_room)
    chat_room = ChatRoomUser.where(chat_room: current_user_chat_rooms, user_id: params[:user_id]).map(&:chat_room).first
    if chat_room.blank?
      chat_room = ChatRoom.create
      ChatRoomUser.create(user_id: current_user.id, chat_room_id: chat_room.id)
      ChatRoomUser.create(user_id: params[:user_id], chat_room_id: chat_room.id)
    end
    redirect_to action: :show, id: chat_room.id
  end

  def show
    @chat_room = ChatRoom.find(params[:id])
    @chat_room_user = @chat_room.chat_room_users.where.not(user_id: current_user.id).first.user
    @chat_messages = ChatMessage.where(chat_room_id: @chat_room.id)
  end
end
