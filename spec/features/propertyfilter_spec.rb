feature "filter properties by owner email" do
  scenario "it filters properties to show those belonging to user"  do
    post_property
    visit('/property/filter')
    fill_in(:email, with: '1234@try.it')
    click_button('Submit')
    expect(page).to have_content('T-Hotel')
  end
end
