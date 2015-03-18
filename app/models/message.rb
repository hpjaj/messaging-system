class Message < ActiveRecord::Base
  belongs_to :user
  # belongs_to :recipient

  validates :recipient_id, presence: true
  validates :body, presence: true
end
