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
    post_property
    expect(Property.all.length).to eq(1)
  end

  scenario 'Adds available night to property on creation' do
    post_property
    expect(AvailableDate.first.date).to eq(Date.parse('29/11/2017'))
  end

  scenario 'adds a range of dates to property' do
    visit ('/property/new')
    fill_in(:name, with: 'Marco')
    fill_in(:description, with: 'Awesome room')
    fill_in(:price, with: '60')
    fill_in(:email, with: '1234@gmail.com')
    fill_in(:start_date, with: '29/11/2017')
    fill_in(:end_date, with: '01/12/2017')
    click_button('Post')
    expect(Property.last.available_dates.length).to eq(3)
  end

end
