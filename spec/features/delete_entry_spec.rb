# As a user
# So that I can keep my diary tidy
# I want to be able to delete a Diary Entry

feature 'Deleting an entry' do
  before do
    create_entry
    view_entries
  end

  scenario 'User can delete entry' do
    expect(page).to have_content 'Test entry'
    click_button('Delete')
    expect(page).not_to have_content 'Test entry'
  end
end
