require_relative 'web_helper'
# As a user
# So that I can browse my previous entries
# I want to see a list of Diary Entry Titles

# As a user
# So that I can read my previous entries
# I want to click on a title to see the full Diary Entry

feature 'List of entry titles' do

  before do
    create_entry
    view_entries
  end
  scenario 'The user can select the option to show their previous entries' do
    expect(page).to have_content "Your diary entries"
  end

  scenario 'The user can see thier previous entries' do
    expect(page).to have_content "Test entry"
  end

  scenario 'User can click on the title of an entry and be shown the content' do
    click_link "Test entry"
    expect(page).to have_content "Test entry"
    expect(page).to have_content "Test content"
  end
end
