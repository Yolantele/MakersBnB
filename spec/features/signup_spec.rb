feature "sign up" do
  scenario "it has a sign up form on home page" do
    visit ('/')
    expect(page).to have_content('sign up')
  end
  scenario "user can sign up" do
    visit('/')
    fill_in(:email_sign_up, with: 'email@example.com')
    fill_in(:password_sign_up, with: 'wordpass')
    fill_in(:mobile_number, with: '+447510336800')
    click_button('Sign Up')
    expect(page).to have_content('You are now a member of MakersBnB, account: email@example.com')
  end
end


feature "sign in" do
  scenario "user can sign in on page" do
    visit('/')
    expect(page).to have_content('sign in')

  end
end
