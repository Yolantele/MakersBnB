feature 'List of properties' do
  scenario 'User can see properties' do
    post_property
    property_id = Property.all.last.id
    visit('/properties')
    expect(page).to have_content("Id: #{property_id} Name: T-Hotel Description: Awesome Price: £60 Email: 1234@try.it ")
  end
  feature 'button redirecting to new request page' do
    scenario 'user clicks on make request button' do
      visit('/properties')
      click_button('Make request')
      expect(page.current_url).to include("/request/new")
    end
  end
end
