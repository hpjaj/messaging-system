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

def create_and_send_message
  click_link 'Create A Message'
  select('Alex', :from => 'message[recipient_id]')
  fill_in 'Body formatted with markdown', with: 'Lorem ipsum'
  click_button 'Send'
end








