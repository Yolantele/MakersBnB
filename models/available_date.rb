class AvailableDate
  include DataMapper::Resource

  property :id, Serial
  property :date, Date

  has n, :houses, through: Resource

end
