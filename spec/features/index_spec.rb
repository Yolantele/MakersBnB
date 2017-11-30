feature 'visiting the home page' do
  scenario 'user can go to the home page' do
    visit('/home')
    expect(page).to have_button(id: 'traveller_enter')
    expect(page).to have_button(id: 'owner_enter')
  end
end
