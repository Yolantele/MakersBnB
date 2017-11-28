describe 'MakersBnB', :type => :feature do

  feature 'visiting the home page' do
    scenario 'user can go to the home page' do
      visit('/home')
      expect(page).to have_content('owner sign-in', 'traveler sign-in')
    end
  end


end
