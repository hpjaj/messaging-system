class Conversation < ActiveRecord::Base
  belongs_to :user
  belongs_to :recipient, :class_name => "User"

  def self.find_conversation(users_id, recipients_id)
    find_by(user_id: users_id, recipient_id: recipients_id)
  end

end
