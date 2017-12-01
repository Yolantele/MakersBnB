feature 'new property' do

  scenario 'Can see form to add property' do
    visit ('/property/new')
    expect(page).to have_field('name')
    expect(page).to have_field('description')
    expect(page).to have_field('price')

    expect(page).to have_button('Post')
  end

  scenario 'Filling in the property form' do
    post_property
    expect(House.all.length).to eq(1)
  end

  scenario 'Adds available night to property on creation' do
    post_property
    expect(AvailableDate.first.date).to eq(Date.parse('21/01/2017'))
  end

  scenario 'adds a range of dates to property' do
    post_new_property(start_date: '29/11/2017', end_date: '01/12/2017')
    expect(House.last.available_dates.length).to eq(3)
  end

  scenario 'can add a property without available dates' do

    expect { post_new_property }.to change { House.all.length }.by(1)
  end

end
