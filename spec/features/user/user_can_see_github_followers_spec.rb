require 'rails_helper'

RSpec.describe 'As a logged in user' do
  it 'user can see all of their github followers' do

    user = create(:user)

    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

    visit dashboard_path

    expect(page).to have_content('Followers')
    #test followers count
    #test links
  end

  it 'no token no followers' do

    user_1 = create(:user, github_token: nil )

    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user_1)

    visit dashboard_path

    expect(page).to_not have_content('Github Repos')
    expect(page).to_not have_content('Followers')
  end
end
