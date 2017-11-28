class Request
  include DataMapper::Resource

  property :id, Serial
  property :name, String
  property :email, String
  property :date, String
  # belongs_to :property

end
