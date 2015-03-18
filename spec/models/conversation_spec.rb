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

end