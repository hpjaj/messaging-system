require 'rails_helper'

RSpec.describe Conversation, :type => :model do

  describe "associations" do

    it "belongs to user" do
      expect(Conversation.new).to belong_to(:user)
    end 

    it "belongs to recipient" do
      expect(Conversation.new).to belong_to(:recipient)
    end

  end

  describe "'find conversation' method" do

    it "returns the conversation containing the passed in users" do
      steve = create_user('Steve')
      tim = create_user('Tim')
      create_message(steve.id, tim.id)
      create_conversation(steve.id, tim.id)
      conversation = Conversation.find_conversation(steve.id, tim.id)
      expect( conversation.user_id ).to eq(steve.id)
      expect( conversation.recipient_id ).to eq(tim.id)
    end

  end

end