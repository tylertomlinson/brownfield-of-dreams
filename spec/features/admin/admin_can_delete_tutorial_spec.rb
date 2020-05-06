require 'rails_helper'

feature "An admin can delete a tutorial" do
  before(:each) do
    admin = create(:admin)

    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(admin)
  end

  it "deleting tutorial" do
    create_list(:tutorial, 2)

    visit "/admin/dashboard"

    expect(page).to have_css('.admin-tutorial-card', count: 2)

    within(first('.admin-tutorial-card')) do
      click_link 'Delete'
    end

    expect(page).to have_css('.admin-tutorial-card', count: 1)
  end

  it "video associated to tutorial is also deleted" do
    tutorial_1 = create(:tutorial)
    create_list(:video, 5, tutorial: tutorial_1)

    tutorial_2 = create(:tutorial)
    create_list(:video, 2, tutorial: tutorial_2)

    expect(Video.where(tutorial_id: tutorial_1.id).count).to eql(5)
    expect(Video.where(tutorial_id: tutorial_2.id).count).to eql(2)
  end
end
