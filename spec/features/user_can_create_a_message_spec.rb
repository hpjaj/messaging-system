require 'rails_helper'

describe 'A new message'  do
  
  include Warden::Test::Helpers
  Warden.test_mode!

  before do
    user = create(:user)
    user_2 = create(:user, name: 'Alex')
    login_as(user, scope: :user)
    visit root_path
    expect( current_path ).to eq root_path
  end

  it 'Is successfully created by a user' do
    create_and_send_message
    expect( page ).to have_content('Message sent')
  end

  it 'is mailed to the recipient' do
    create_and_send_message
    email_body = ActionMailer::Base.deliveries.last.body.encoded
    expect( email_body ).to have_content("Lorem ipsum")
    ActionMailer::Base.deliveries = []
  end


  def create_and_send_message
    click_link 'Create A Message'
    select('Alex', :from => 'message[recipient_id]')
    fill_in 'Body formatted with markdown', with: 'Lorem ipsum'
    click_button 'Send'
  end

end
