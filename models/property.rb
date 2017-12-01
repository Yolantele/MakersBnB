class House
  include DataMapper::Resource

  property :id, Serial
  property :name, String
  property :description, Text
  property :price, Integer


  has n, :requests
  has n, :available_dates, through: Resource
  belongs_to :user

end
