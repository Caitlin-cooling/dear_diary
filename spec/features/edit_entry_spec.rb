# As a user
# So that I can keep my diary tidy
# I want to be able to delete a Diary Entry

feature 'Editing an entry' do
  before do
    create_entry
    view_entries
    click_button "Edit"
  end

  scenario 'click edit button takes user to edit page ' do
    expect(page).to have_content "Edit your entry"
    expect(page).to have_field "title"
    expect(page).to have_field "content"
  end

  scenario 'the user can save their changes' do
    fill_in 'title', with: 'Monday'
    fill_in 'content', with: 'Do something'
    click_button("Submit")
    expect(page).to have_content "Monday"
  end
end
