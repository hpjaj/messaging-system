class MessagesController < ApplicationController
  def new
    @message = Message.new
  end

  def create
    @message = Message.new(message_params)
    @message.user = current_user
    if @message.save
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

end
