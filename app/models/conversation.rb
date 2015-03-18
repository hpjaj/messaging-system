class Conversation < ActiveRecord::Base
  belongs_to :user
  belongs_to :recipient, :class_name => "User"
end
