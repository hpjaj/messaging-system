require 'rails_helper'

describe 'User logs in' do
  it 'Successfully' do
    @user = create(:user)
    visit welcome_index_path
    click_link 'Log In'
    expect( current_path ).to eq new_user_session_path
    fill_in 'Email', with: @user.email
    fill_in 'Password', with: @user.password
    click_button 'Sign in'
    expect( current_path ).to eq root_path
    expect( page ).to have_content(@user.name)
  end
end