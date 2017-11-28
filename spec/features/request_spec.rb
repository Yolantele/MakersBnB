feature 'new request' do

  scenario 'Can fill in a request form' do
    visit ('/request/new')
    expect(page).to have_field('traveller_name')
    expect(page).to have_field('traveller_email')
    expect(page).to have_field('date')
    expect(page).to have_button('Submit request')
  end

  scenario 'request is created' do
    visit ('/request/new')
    fill_in(:traveller_name, with: 'JJ')
    fill_in(:traveller_email, with: 'email@email.co.uk')
    fill_in(:date, with: '1st of Dec')
    click_button('Submit request')
    expect(Request.all.length).to eq(1)
  end
end
