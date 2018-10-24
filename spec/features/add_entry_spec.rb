# As a user
# So that I can keep a daily diary
# I want to be able to add a new Diary Entry
feature 'New entry' do
  scenario 'Can add a new entry' do
    visit '/'
    click_button("New Entry")
    expect(page).to have_content "Write a new diary entry"
  end
end
