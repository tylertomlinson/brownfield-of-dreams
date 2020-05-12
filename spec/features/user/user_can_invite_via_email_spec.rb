require 'rails_helper'
# Background: We want to be able to enter a user's Github handle and send them an email invite to our app. You'll use the Github API to retrieve the email address of the invitee.

describe 'As a registered user' do
  it "I can send an invite to a github user via email" do

  user = create(:user)

  allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

  visit dashboard_path

  click_link "Send an Invite"

  expect(current_path).to eq('/invite')

    # As a registered user
    # When I visit /dashboard
    # And I click "Send an Invite"
    # Then I should be on /invite

  fill_in "GitHub Handle", with: 'jcasimir'

  click_button "Send Invite"

  expect(current_path).to eq(dashboard_path)

  expect(page).to have_content("Successfully sent invite!")
  end
end

#need to edge case test as well


# And when I fill in "Github Handle" with <A VALID GITHUB HANDLE>
# And I click on "Send Invite"
# Then I should be on /dashboard
# And I should see a message that says "Successfully sent invite!" (if the user has an email address associated with their github account)
#Or I should see a message that says "The Github user you selected doesn't have an email address associated with their account."
