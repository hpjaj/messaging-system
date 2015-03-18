module ConversationsHelper

  def sender_of(the_message)
    if current_user == the_message.recipient_id
      User.find_by(id: the_message.recipient_id).name.titleize 
    else 
      User.find_by(id: the_message.user_id).name.titleize 
    end 
  end

end
