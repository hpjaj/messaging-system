# Methods that are common to multiple files

def create_message(sender_id, receiver_id)
  Message.create(user_id: sender_id, recipient_id: receiver_id, body: "Lorem ipsum to #{User.find(receiver_id).name}")
end

def create_conversation(sender_id, receiver_id)
  Conversation.create(user_id: sender_id, recipient_id: receiver_id)
end

