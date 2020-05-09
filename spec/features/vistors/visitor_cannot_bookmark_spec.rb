require 'rails_helper'

describe 'visitor visits video show page' do
  it 'cannot click bookmark and sees a message saying they need to log in' do
    tutorial = create(:tutorial)
    video = create(:video, tutorial_id: tutorial.id)

    visit tutorial_path(tutorial)

    within ".bookmarks-btn" do
      within ".tooltiptext" do
        expect(page).to have_content("Sign in to bookmark videos")
      end
    end
  end
end
