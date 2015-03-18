module ConversationsHelper

  def sender_of(message)
    if current_user == message.recipient_id
      User.find_by(id: message.recipient_id).name.titleize 
    else 
      User.find_by(id: message.user_id).name.titleize 
    end 
  end

  def latest_message(conversation)
    @recent_message = Message.where(recipient_id: conversation.recipient_id).last
  end

end
