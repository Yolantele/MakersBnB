class AvailableDate
  include DataMapper::Resource

  property :id, Serial
  property :date, Date

  has n, :property, through: Resource

end
