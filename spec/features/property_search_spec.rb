feature 'User can search for properties' do
  scenario 'user can search for an available night' do
    post_new_property
    visit('/property/search')
    fill_in(:chosen_date, with: '21/01/2017')
    click_button('Search')
    expect(page).to have_content('My House')
  end

  scenario "user won't see properties that aren't available on the selected date" do
    post_new_property(name: 'Another House', start_date: '13/01/2017', end_date: '15/01/2017')
    visit('/property/search')
    fill_in(:chosen_date, with: '21/01/2017')
    click_button('Search')
    expect(page).not_to have_content('Another House')
  end
end
