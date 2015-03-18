require 'rails_helper'

describe 'User creates a new message'  do
  
  include Warden::Test::Helpers
  Warden.test_mode!

  it 'successfully' do
    user = create(:user)
    user_2 = create(:user, name: 'Alex')
    login_as(user, scope: :user)
    visit root_path
    expect( current_path ).to eq root_path
    click_link 'Create A Message'
    select('Alex', :from => 'message[recipient_id]')
    fill_in 'Body formatted with markdown', with: 'Lorem impsum'
    click_button 'Send'
    expect( page ).to have_content('Message sent')
  end

end