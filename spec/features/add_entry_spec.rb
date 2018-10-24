require_relative 'web_helper'

# As a user
# So that I can keep a daily diary
# I want to be able to add a new Diary Entry
feature 'New entry' do
  scenario 'Shown new entry page' do
    make_new_entry
    expect(page).to have_content "Write a new diary entry"
  end

  scenario 'Can enter new entry' do
    make_new_entry
    fill_in('entry', with: 'Test')
    click_button("Done")
    expect(page).to have_content "New entry created"
    expect(page).to have_content "Test"
  end
end
