feature 'new property' do

  scenario 'Can see form to add property' do
    visit ('/property/new')
    expect(page).to have_field('name')
    expect(page).to have_field('description')
    expect(page).to have_field('price')
    expect(page).to have_field('email')
    expect(page).to have_button('Post')
  end

  scenario 'Filling in the property form' do
    visit ('/property/new')
    fill_in(:name, with: 'Marco')
    fill_in(:description, with: 'Awesome room')
    fill_in(:price, with: '60')
    fill_in(:email, with: '1234@gmail.com')
    click_button('Post')
    p Property
    expect(Property.all.length).to eq(1)
  end

end
