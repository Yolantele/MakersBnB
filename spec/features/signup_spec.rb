feature "sign up" do
  scenario "it has a sign up form on home page" do
    visit ('/')
    expect(page).to have_content('sign up')
  end
  scenario "user can sign up" do
    visit('/')
    fill_in(:email, with: 'email@example.com')
    fill_in(:password, with: 'wordpass')
    click_button('Sign Up')
    expect(page).to have_content('You are now a member of MakersBnB, account: email@example.com')
  end
end
