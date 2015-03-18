require 'rails_helper'

RSpec.describe User, :type => :model do

  describe "associations" do

    it "has many messages" do
      expect(User.new).to have_many(:messages)
    end 

    it "has many conversations" do
      expect(User.new).to have_many(:conversations)
    end 

    it "has many recipients" do
      expect(User.new).to have_many(:recipients)
    end 

  end

  describe "validations" do

    it "validates the presence of a user's name" do
      should validate_presence_of(:name)
    end

  end 
end