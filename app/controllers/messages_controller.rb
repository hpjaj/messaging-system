class MessagesController < ApplicationController

  def new
    @message = Message.new
  end

  def create
    @message = Message.new(message_params)
    @message.user = current_user
    user_is_sender_conversation = Conversation.find_conversation(current_user, params[:message][:recipient_id])
    user_is_receiver_conversation = Conversation.find_conversation(params[:message][:recipient_id], current_user)
    if @message.save
      if user_is_sender_conversation == nil
        create_conversation(current_user, params[:message][:recipient_id])
      end

      if user_is_receiver_conversation == nil
        create_conversation(User.find_by(id: params[:message][:recipient_id]), current_user.id)
      end

      add_one_to_conversations_message_count(current_user, params[:message][:recipient_id])
      add_one_to_conversations_message_count(params[:message][:recipient_id], current_user)

      MessageMailer.new_message_email(@message).deliver
      redirect_to root_path, notice: "Message sent"
    else
      render :new
    end
  end

private

  def message_params
    params.require(:message).permit(:body, :recipient_id, :user_id)
  end

  def create_conversation(sender, receiver_id)
    conversation = sender.conversations.build(:recipient_id => receiver_id)
    conversation.save!
  end

  def add_one_to_conversations_message_count(sender_id, receiver_id)
    conversation = Conversation.find_conversation(sender_id, receiver_id)
    conversation.total_message_count += 1
    conversation.save!
  end

end
