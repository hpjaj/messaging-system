class Conversation < ActiveRecord::Base
  belongs_to :user
  belongs_to :recipient, :class_name => "User"

  def self.find_conversation(user_id, recipient_id)
    find_by(user_id: user_id, recipient_id: recipient_id)
  end

end
