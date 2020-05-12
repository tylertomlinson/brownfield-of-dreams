require 'rails_helper'

# Background: We want to be able to enter a user's Github handle and send them an email invite to our app. You'll use the Github API to retrieve the email address of the invitee.

describe 'As a registered user' do
  it "I can send an invite to a github user via email" do

  user = create(:user)

  allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

  visit dashboard_path

  click_link "Send an Invite"

  expect(current_path).to eq('/invite')

  fill_in "GitHub Handle", with: 'jcasimir'

  click_button "Send Invite"

  expect(current_path).to eq(dashboard_path)

  expect(page).to have_content("Successfully sent invite!")
  end
end

#now need to use githubservice to collect email address

#need to edge case test as well

#Or I should see a message that says "The Github user you selected doesn't have an email address associated with their account."
