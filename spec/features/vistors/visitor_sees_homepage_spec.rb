require 'rails_helper'

describe 'Visitor' do
  describe 'on the home page' do
    it 'can see a list of tutorials' do
      tutorial1 = create(:tutorial)
      tutorial2 = create(:tutorial)

      video1 = create(:video, tutorial_id: tutorial1.id)
      video2 = create(:video, tutorial_id: tutorial1.id)
      video3 = create(:video, tutorial_id: tutorial2.id)
      video4 = create(:video, tutorial_id: tutorial2.id)

      user = create(:user)

      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

      visit root_path

      expect(page).to have_css('.tutorial', count: 2)

      within(first('.tutorials')) do
        expect(page).to have_css('.tutorial')
        expect(page).to have_css('.tutorial-description')
        expect(page).to have_content(tutorial1.title)
        expect(page).to have_content(tutorial1.description)
      end
    end

    it 'cannot see classroom content if not logged in' do
      tutorial1 = create(:tutorial)
      prework_tutorial_data = {
        "title"=>"Back End Engineering - Prework",
        "description"=>"Videos for prework.",
        "thumbnail"=>"https://i.ytimg.com/vi/qMkRHW9zE1c/hqdefault.jpg",
        "playlist_id"=>"PL1Y67f0xPzdN6C-LPuTQ5yzlBoz2joWa5",
        "classroom"=>true,
      }
      prework_tutorial = Tutorial.create! prework_tutorial_data

      video1 = create(:video, tutorial_id: tutorial1.id)
      video2 = create(:video, tutorial_id: tutorial1.id)
      video3 = create(:video, tutorial_id: prework_tutorial.id)
      video4 = create(:video, tutorial_id: prework_tutorial.id)

      visit root_path

      expect(page).to have_css('.tutorial', count: 1)

    end
  end
end
