feature 'List of properties' do
  scenario 'User can see properties' do
    post_property
    visit('/properties')
    expect(page).to have_content("Name: T-Hotel Description: Awesome Price: £60 Email: 1234@try.it ")
  end
end
