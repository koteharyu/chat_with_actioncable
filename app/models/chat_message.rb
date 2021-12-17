class ChatMessage < ApplicationRecord
  after_create_commit { ChatMessageBroadcastJob.perform_later self }

  belongs_to :chat_room
  belongs_to :user

  validates :content, presence: true
end
