import consumer from './consumer'

const appChatRoom = consumer.subscriptions.create("ChatRoomChannel", {
  connected() {

  },

  disconnected() {

  },

  received(data) {
    const chatMessages = document.getElementById('chat-messages')
    chatMessages.insertAdjacentHTML('beforeend', data['chat_message'])
  },

  speak: function(chat_message, chat_room_id) {
    return this.perform('speak', { chat_message: chat_message, chat_room_id: chat_room_id})
  }
});

if (/chat_rooms/.test(location.pathname)) {
  $(document).on("click", ".send-message", function(e) {
    const chat_room_id = $('textarea').data('chat_room_id')
    appChatRoom.speak($('textarea').val(), chat_room_id);
    $('textarea').val("");
    e.preventDefault();
  })
}
