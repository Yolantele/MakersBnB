feature 'visiting the home page' do

    scenario 'user can go to the home page' do
      visit('/home')
      fill_in(:user_email, with: 'email')
      fill_in(:user_password, with: 'password')
      click_button('Enter')
      expect(page).to have_content('traveller side')
    end
  end

end
