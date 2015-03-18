# Methods that are common to multiple spec files

def create_message(sender_id, receiver_id, body="Lorem ipsum to #{User.find(receiver_id).name}")
  Message.create(user_id: sender_id, recipient_id: receiver_id, body: body)
end

def create_conversation(sender_id, receiver_id)
  Conversation.create(user_id: sender_id, recipient_id: receiver_id)
end

def create_user(name)
  user = User.new(
  name:     name,
  email:    "#{name}@example.com",
  password: 'password'
  )
  user.skip_confirmation!
  user.save!
  return user
end








