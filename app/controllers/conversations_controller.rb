class ConversationsController < ApplicationController
  
  def index
    @conversations = current_user.conversations if current_user
  end

  def show
    current_conversation = Conversation.find(params[:id])
    @messages = Message.conversations_sent_and_received_messages(current_conversation, current_user)
  end

  def destroy
    @conversations = current_user.conversations.find(params[:id])
    @conversations.destroy
    flash[:notice] = 'Conversation deleted'
    redirect_to root_path
  end

end
