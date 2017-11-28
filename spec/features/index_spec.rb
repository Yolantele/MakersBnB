feature 'visiting the home page' do
  scenario 'user can go to the home page' do
    visit('/home')
    expect(page).to have_content('User email:', 'User password:')
    expect(page).to have_content('Owner email:', 'Owner password:')
  end
end
