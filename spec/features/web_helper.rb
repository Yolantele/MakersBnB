def post_property
  visit('/property/new')
  fill_in(:name, with: 'T-Hotel')
  fill_in(:description, with: 'Awesome')
  fill_in(:price, with: '60')
  fill_in(:email, with: '1234@try.it')
  fill_in(:start_date, with:'21/01/2017')
  fill_in(:end_date, with: '21/01/2017')
  click_button('Post')
end

def post_new_property(name: 'My House', description: '3 Bed Semi', price: '50',
    email: 'me@mail.com', start_date: '21/01/2017', end_date: '22/01/2017')
  visit('/property/new')
  fill_in(:name, with: name)
  fill_in(:description, with: description)
  fill_in(:price, with: price)
  fill_in(:email, with: email)
  fill_in(:start_date, with: start_date)
  fill_in(:end_date, with: end_date)
  click_button('Post')
end

def request_property
  visit('/request/new')
  property_id = Property.all.last.id
  fill_in(:property_id, with: property_id.to_s)
  fill_in(:traveller_name, with:'Marco')
  fill_in(:traveller_email, with: 'Marco@awesome.it')
  fill_in(:date, with: '30/12/2017')
  click_button('Submit request')
end
