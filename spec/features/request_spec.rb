feature 'new request' do

  scenario 'Can fill in a request form' do
    visit ('/request/new')
    expect(page).to have_field('property_id')
    expect(page).to have_field('traveller_name')
    expect(page).to have_field('traveller_email')
    expect(page).to have_field('date')
    expect(page).to have_button('Submit request')
  end

  scenario 'request is created' do
    visit ('/property/new')
    fill_in(:name, with: 'Marco')
    fill_in(:description, with: 'Awesome room')
    fill_in(:price, with: '60')
    fill_in(:email, with: '1234@gmail.com')
    click_button('Post')
    property_id = Property.all.last.id

    visit ('/request/new')
    fill_in(:property_id, with: property_id.to_s)
    fill_in(:traveller_name, with: 'JJ')
    fill_in(:traveller_email, with: 'email@email.co.uk')
    fill_in(:date, with: '1st of Dec')
    click_button('Submit request')
    expect(Request.all.length).to eq(1)
  end
end
