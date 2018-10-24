require_relative 'web_helper'

# As a user
# So that I can keep a daily diary
# I want to be able to add a new Diary Entry

# As a user
# So that I can identify my entry in future
# I want to give each Diary Entry a title

feature 'New entry' do
  scenario 'Shown new entry page' do
    choose_make_new_entry
    expect(page).to have_content "Write a new diary entry"
  end

  scenario 'Can enter new entry with a title and content' do
    create_entry
    expect(page).to have_content "Your entry has been created"
  end
end
