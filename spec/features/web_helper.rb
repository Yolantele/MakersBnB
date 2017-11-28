def post_property
  visit('/property/new')
  fill_in(:name, with: 'T-Hotel')
  fill_in(:description, with: 'Awesome')
  fill_in(:price, with: '60')
  fill_in(:email, with: '1234@try.it')
  click_button('Post')
end
