class ChatRoomChannel < ApplicationCable::Channel
  def subscribed
    stream_from "chat_room_channel"
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end

  def speak(data)
    ChatMessage.create!(
      content: data['chat_message'],
      chat_room_id: data['chat_room_id'],
      user_id: current_user.id
    )
  end
end
