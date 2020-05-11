require 'rails_helper'

describe 'A logged in user' do
  it 'user can link github account' do

    # OmniAuth.config.mock_auth[:github] = nil

    Rails.application.env_config["omniauth.auth"] = OmniAuth.config.mock_auth[:github]

    user = create(:user, github_token: nil)

    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

    visit dashboard_path

    click_on "Connect to GitHub"
    save_and_open_page

    expect(current_path).to eq(dashboard_path)

    expect(page).to have_content('Followers')
    expect(page).to have_content('Following')

    expect(page).to_not have_link("Connect to GitHub")
  end
end
