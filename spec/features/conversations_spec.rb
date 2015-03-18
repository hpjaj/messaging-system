require 'rails_helper'

describe 'Conversations'  do
  
  include Warden::Test::Helpers
  Warden.test_mode!

  before do
    @user_1 = create_user('John')
    @user_2 = create_user('Alex')
    user_3 = create_user('Sam')
    user_4 = create_user('Susan')
    message_1 = create_message(@user_1.id, @user_2.id)
    message_2 = create_message(@user_1.id, user_3.id)
    message_3 = create_message(@user_1.id, user_4.id)
    @conversation_1 = create_conversation(@user_1.id, @user_2.id)
    conversation_2 = create_conversation(@user_1.id, user_3.id)
    login_as(@user_1, scope: :user)
    visit root_path
  end

  it 'are displayed on a users conversation index page' do
    expect( page ).to have_content('Lorem ipsum to Alex')
    expect( page ).to have_content('Lorem ipsum to Sam')
    expect( page ).to_not have_content('Lorem ipsum to Susan')
  end

  it 'index page display a truncated version of the conversions body' do
    expect( page ).to have_content('Alex')
    expect( page ).to have_content('Sam')
    expect( page ).to_not have_content('Susan')
  end

  it 'show view displays the back and forth messages between the two specific users' do
    create_message(@user_2.id, @user_1.id)
    create_message(@user_1.id, @user_2.id, "Third message")
    visit conversation_path(@conversation_1)
    expect( page ).to have_content("Alex said")
    expect( page ).to have_content("John said")
    expect( page ).to have_content("Lorem ipsum to John")
    expect( page ).to have_content("Lorem ipsum to Alex")
    expect( page ).to have_content("Third message")
  end

  it "increase in total message count by one everytime a message is sent" do
    expect( @conversation_1.total_message_count).to eq(0)
    
    create_and_send_message
    @conversation_1.reload
    recipient_conversation = Conversation.find_by(user_id: @user_2.id, recipient_id: @user_1.id)
    recipient_conversation.reload
    expect( @conversation_1.total_message_count).to eq(1)
    expect( recipient_conversation.total_message_count).to eq(1)

    create_and_send_message
    @conversation_1.reload
    recipient_conversation.reload
    expect( @conversation_1.total_message_count).to eq(2)
    expect( recipient_conversation.total_message_count).to eq(2)
  end


end
