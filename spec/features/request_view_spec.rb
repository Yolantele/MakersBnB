feature 'view request' do
  scenario 'The owner can write its email in a text input adn click a submit button' do
    post_property
    request_property
    visit ('/request/view')
    fill_in(:owneremail, with: '1234@try.it')
    click_button('See Requests')
    expect(page).to have_content("Marco, Marco@awesome.it, 30/12/2017")
  end
  scenario 'The Request aproval state is changed to True' do
    post_property
    request_property
    visit ('/request/view')
    fill_in(:owneremail, with: '1234@try.it')
    click_button('See Requests')
    request_id = Request.last.id
    fill_in(:request_id_confirmed, with: request_id)
    click_button('Accept Request')
    expect(Request.all.last.approved).to be(true)
  end
end
