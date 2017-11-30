feature 'Traveller Home' do
    scenario 'user can fill in traveler form' do
    visit('/home')
    click_button(id: 'traveller_enter')
    expect(page.current_url).to include('/properties')
  end
end
