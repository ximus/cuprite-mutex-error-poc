require "rails_helper"

feature "test", :js, :type => :feature do
  scenario "test" do
    visit root_path
    expect(page).to have_content("foo content")
  end
end
