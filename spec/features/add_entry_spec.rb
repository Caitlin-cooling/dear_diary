require_relative 'web_helper'

# As a user
# So that I can keep a daily diary
# I want to be able to add a new Diary Entry
feature 'New entry' do
  scenario 'Can add a new entry' do
    make_new_entry
    expect(page).to have_content "Write a new diary entry"
  end
end
