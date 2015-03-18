class MessagesController < ApplicationController
  before_action :authenticate_user!
  
  def new
    @message = Message.new
    @potential_recipients = User.where.not(id: current_user).order(:name)
  end

  def create
    ## assign local and instance variables
    @message = Message.new(message_params)
    @message.user = current_user
    recipient_id = params[:message][:recipient_id]
    user_is_sender_in_conversation = Conversation.find_conversation(current_user, recipient_id)
    user_is_receiver_in_conversation = Conversation.find_conversation(recipient_id, current_user)

    if @message.save
      ## check for existing Conversations, if nil, create one/both
      if user_is_sender_in_conversation == nil
        create_conversation(current_user, recipient_id)
      end
      
      if user_is_receiver_in_conversation == nil
        create_conversation(User.find_by(id: recipient_id), current_user.id)
      end

      ## Increasing a conversation's message count updates the 
      ## conversation's updated_at field --> Used for sorting conversations
      add_one_to_conversations_message_count(current_user, recipient_id)
      add_one_to_conversations_message_count(recipient_id, current_user)

      MessageMailer.new_message_email(@message).deliver
      redirect_to root_path, notice: "Message sent"
    else
      render :new
    end
  end

private

  def message_params
    params.require(:message).permit(:body, :recipient_id)
  end

  def create_conversation(sender, receiver_id)
    conversation = sender.conversations.build(recipient_id: receiver_id)
    conversation.save!
  end

  def add_one_to_conversations_message_count(sender_id, receiver_id)
    conversation = Conversation.find_conversation(sender_id, receiver_id)
    conversation.total_message_count += 1
    conversation.save!
  end

end
