feature 'Traveller Home' do
    scenario 'user can fill in traveler form' do
    visit('/home')
    fill_in(:user_email, with: 'email')
    fill_in(:user_password, with: 'password')
    click_button(id: 'traveller_enter')
    expect(page.current_url).to include('/properties')
  end
end
