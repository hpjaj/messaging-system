class ConversationsController < ApplicationController
  before_action :authenticate_user!

  def index
    @conversations = current_user.conversations.order('updated_at DESC')   
  end

  def show
    current_conversation = Conversation.find(params[:id])
    @messages = Message.conversations_sent_and_received_messages(current_conversation, current_user)
  end

  def destroy
    conversation = current_user.conversations.find(params[:id])
    conversation.destroy
    flash[:notice] = 'Conversation deleted'
    redirect_to root_path
  end

end
