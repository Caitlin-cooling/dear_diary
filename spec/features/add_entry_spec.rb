require_relative 'web_helper'

# As a user
# So that I can keep a daily diary
# I want to be able to add a new Diary Entry

# As a user
# So that I can identify my entry in future
# I want to give each Diary Entry a title

feature 'New entry' do
  scenario 'Shown new entry page' do
    make_new_entry
    expect(page).to have_content "Write a new diary entry"
  end

  scenario 'Can enter new entry with a title and content' do
    make_new_entry
    fill_in('title', with: "Test entry")
    click_button "Done"
    expect(page).to have_content "New entry created"
    expect(page).to have_content "Test entry"
  end
end

# As a user
# So that I can browse my previous entries
# I want to see a list of Diary Entry Titles
feature 'List of entry titles' do
  scenario 'The user can select the option to show their previous entries' do
    view_entries
    expect(page).to have_content "Your diary entries"
  end

  scenario 'The user can see thier previous entries' do
    make_new_entry
    fill_in('title', with: "Test entry")
    click_button "Done"
    view_entries
    expect(page).to have_content "Test entry"
  end
end
