require 'rails_helper'

describe 'Conversations'  do
  
  include Warden::Test::Helpers
  Warden.test_mode!

  before do
    user_1 = create(:user, name: 'John')
    user_2 = create(:user, name: 'Alex')
    user_3 = create(:user, name: 'Sam')
    user_4 = create(:user, name: 'Susan')
    message_1 = create_message(user_1.id, user_2.id)
    message_2 = create_message(user_1.id, user_3.id)
    message_3 = create_message(user_1.id, user_4.id)
    conversation_1 = create_conversation(user_1.id, user_2.id)
    conversation_2 = create_conversation(user_1.id, user_3.id)
    login_as(user_1, scope: :user)
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

end
