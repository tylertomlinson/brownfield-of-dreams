require 'rails_helper'

describe 'As a logged in user' do
  it 'can see GitHub section with 5 repos including links', :vcr do

    user = create(:user)

    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

    visit dashboard_path

    expect(page).to have_content('GitHub Repos')
    expect(page).to have_css('.repos', count: 5)
  end

  it 'no token no github' do

    user_1 = create(:user, github_token: nil )

    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user_1)

    visit dashboard_path

    expect(page).to_not have_content('GitHub Repos')
  end
end
