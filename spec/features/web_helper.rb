def make_new_entry
  visit '/'
  click_button("New Entry")
end

def view_entries
  visit '/'
  click_button "View Entries"
end
