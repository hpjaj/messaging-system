require 'rails_helper'

RSpec.describe Message, :type => :model do

  describe "associations" do

    it "belongs to user" do
      expect(Message.new).to belong_to(:user)
    end 

  end

  describe "validations" do

    it "validates the presence of a recipient_id" do
      should validate_presence_of(:recipient_id)
    end

    it "validates the presence of message body content" do
      should validate_presence_of(:body)
    end

  end 
end