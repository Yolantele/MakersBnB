def new_property_error_message(name, description, price, email)
  if price != price.to_i.to_s
    'Please enter a valid price (numeric characters only)'
  elsif description.empty? || name.empty? || email.empty?
    'Please fill in all boxes'
  end
end
