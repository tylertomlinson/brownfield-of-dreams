require 'rails_helper'

RSpec.describe 'As a logged in user' do
  it 'user can see their gihub following' do

    user = create(:user)

    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

    visit dashboard_path

    expect(page).to have_content('Following')
    expect(page).to have_css('.following', minimum: 8)
  end

  it 'no token no following' do

    user_1 = create(:user, github_token: nil )

    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user_1)

    visit dashboard_path

    expect(page).to_not have_content('Github Repos')
    expect(page).to_not have_content('Followers')
    expect(page).to_not have_content('Following')
  end
end
