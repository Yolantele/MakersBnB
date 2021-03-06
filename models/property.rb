class Property
  include DataMapper::Resource

  property :id, Serial
  property :name, String
  property :description, Text
  property :price, Integer
  property :email, String

  has n, :requests
  has n, :available_dates, through: Resource

end
