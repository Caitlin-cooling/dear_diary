def choose_make_new_entry
  visit '/'
  click_button("New Entry")
end

def create_entry
  choose_make_new_entry
  fill_in('title', with: "Test entry")
  fill_in('content', with: "Test content")
  click_button "Done"
end

def view_entries
  visit '/'
  click_button "View Entries"
end
