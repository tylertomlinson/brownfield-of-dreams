require 'rails_helper'

describe "As a logged in user" do
  it "can see Github section with 5 repos including links" do

  user = create(:user)

  allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

    visit dashboard_path

    expect(page).to have_css(".repos", count: 5)

  end
end
