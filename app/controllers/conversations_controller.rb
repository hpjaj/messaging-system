class ConversationsController < ApplicationController
  
  def index
    @conversations = current_user.conversations if current_user
  end

  def show
  end

  def destroy
    @conversations = current_user.conversations.find(params[:id])
    @conversations.destroy
    flash[:notice] = 'Conversation deleted'
    redirect_to root_path
  end

end
