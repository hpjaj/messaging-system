class Message < ActiveRecord::Base
  belongs_to :user

  validates :recipient_id, presence: true
  validates :body, presence: true

  def self.conversations_sent_and_received_messages(conversation, user)
    sent_messages = self.where(user_id: user).where(recipient_id: conversation.recipient_id)
    received_messages = self.where(user_id: conversation.recipient_id).where(recipient_id: user)
    all_messages = ( sent_messages + received_messages ).sort { |x,y| y.created_at <=> x.created_at}
  end

end
