feature 'Homepage allows you to add a new entry' do
  scenario 'Able to click new entry button' do
    visit '/'
    click_button("New Entry")
  end
end
