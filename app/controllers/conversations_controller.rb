class ConversationsController < ApplicationController
  
  def index
    @conversations = current_user.conversations if current_user
  end

  def show
    conversation = Conversation.find(params[:id])
    sent_messages = Message.where(user_id: current_user).where(recipient_id: conversation.recipient_id)
    received_messages = Message.where(user_id: conversation.recipient_id).where(recipient_id: current_user)
    @messages = ( sent_messages + received_messages ).sort { |x,y| y.created_at <=> x.created_at}
  end

  def destroy
    @conversations = current_user.conversations.find(params[:id])
    @conversations.destroy
    flash[:notice] = 'Conversation deleted'
    redirect_to root_path
  end

end
