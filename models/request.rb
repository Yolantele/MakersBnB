class Request
  include DataMapper::Resource

  property :id, Serial
  property :name, String
  property :email, String
  property :date, String
  property :approved, Boolean, default: false

  belongs_to :property, :constraint => :skip

end
