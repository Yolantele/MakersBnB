def new_property_error?(name, description, price, email)
  (price != price.to_i.to_s) || description.empty? || name.empty? || email.empty?
end

def new_property_error_message(name, description, price, email)
  if price != price.to_i.to_s
    'Please enter a valid price (numeric characters only)'
  else
    'Please fill in all required fields'
  end
end

def create_property(name, description, price, email, start_date, end_date)
  property = Property.create(name: name, description: description, price: price.to_i, email: email)
  unless start_date.empty? || end_date.empty?
    (Date.parse(start_date)..Date.parse(end_date)).to_a.each do |night|
      property.available_dates << AvailableDate.first_or_create(date: night)
    end
    property.save
  end
end

def search_properties(chosen_date, max_price)
  chosen_date = AvailableDate.first(date: Date.parse(chosen_date))
  search_results = Property.all.select { |bnb| bnb.available_dates.include?(chosen_date) }
  search_results = search_results.select { |bnb| bnb.price <= max_price.to_i } unless max_price.empty?
  search_results
end

def current_user
  @current_user ||= User.get(session[:user_id])
end
