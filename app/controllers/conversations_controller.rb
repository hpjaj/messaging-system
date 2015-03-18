class ConversationsController < ApplicationController
  
  def index
    @conversations = current_user.conversations if current_user
  end

  def show
    current_conversation = Conversation.find(params[:id])
    @messages = conversations_sent_and_received_messages(current_conversation, current_user)
  end

  def destroy
    @conversations = current_user.conversations.find(params[:id])
    @conversations.destroy
    flash[:notice] = 'Conversation deleted'
    redirect_to root_path
  end

private
  
  def conversations_sent_and_received_messages(conversation, user)
    sent_messages = Message.where(user_id: user).where(recipient_id: conversation.recipient_id)
    received_messages = Message.where(user_id: conversation.recipient_id).where(recipient_id: user)
    all_messages = ( sent_messages + received_messages ).sort { |x,y| y.created_at <=> x.created_at}
  end

end
