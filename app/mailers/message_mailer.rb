class MessageMailer < ActionMailer::Base
  
  def new_message_email(new_message_content)
    @new_message_content = new_message_content
    sender = User.find(new_message_content.user_id)
    receiver = User.find(new_message_content.recipient_id)

    from_email = "Messenger Notifications <do-not-reply@mindonrails.com>"
    subject = "New message from #{sender.name.titleize}" 

    mail(to: receiver.email, from: from_email, subject: subject)

  end

end