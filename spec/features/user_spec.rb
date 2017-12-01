
feature "posting a property" do
  scenario "when logged in, the property is posted in the account of the user" do
    post_new_property_2
    property = House.last
    expect(property.user.email).to eq('email@example.com')
  end
end
